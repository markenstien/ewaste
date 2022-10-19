<?php
    use Services\UserService;
    load(['UserService'], SERVICES);

    class User extends APIController
    {

        public function __construct()
        {
            parent::__construct();
            parent::validateAppUser();
            $this->userModel = model('UserModel');
        }
        public function authenticate() {
            $messages = [];
            if(parent::isPost()) {
                $user = $this->userModel->get([
                    'email' =>  trim($this->inputs['email'])
                ]);

                dd($user);

                if(!$user) {
                    $messages = [
                        "User not found"
                    ];
                } else {
                    if(isEqual($user->password, trim($this->inputs['password']))) {
                        $messages = [
                            "User Authenticated!"
                        ];   
                    }else{
                        $messages = [
                            "Incorrect Password"
                        ];
                        
                        $user = false;
                    }
                    
                }
                parent::jsonResponse([
                    'user' => $user
                ], ['messages' => $messages]);
            }
        }

        public function forgetPassword() {
            //send email
            
        }

        public function index() {

            if (isset($this->inputs['id'])) {
                parent::json($this->userModel->get($this->inputs['id']));
            } if(isset($this->inputs['keyword'])) {
                $keyword = $this->inputs['keyword'];
                $where = $this->userModel->conditionConvert([
                    'username' => $keyword,
                    'firstname' => $keyword,
                    'lastname' => $keyword,
                    'email' => $keyword,
                ], 'like' , 'OR');

                parent::json(
                    $this->userModel->getAll([
                        'where' => $where,
                        'fields' => $this->userModel->_public
                    ])
                );

            } else if(isset($this->inputs['adv'])) {
                parent::json(
                    $this->userModel->all($this->userModel->getFillablesOnly($this->inputs))
                );
            }else {
                parent::json($this->userModel->all());
            }
            
        }

        public function add() {
            if($userId = $this->userModel->save($this->inputs)) {
                parent::json([
                    'message' => $this->userModel->getMessageString(),
                    'userId'  => $userId
                ]);
            }
        }

        public function edit() {
            $inputs = $this->inputs;

            if($userId = $this->userModel->save($inputs, $inputs['id'])) {
                parent::json([
                    'message' => $this->userModel->getMessageString(),
                    'userId'  => $userId
                ]);
            }
        }

        public function delete() {
            $inputs = $this->inputs;
            $result = $this->userModel->delete($inputs['id']);

            if($result) {
                $message = "DELETED SUCCESSFULLY";
            }else{
                $message = "ERROR";
            }

            parent::json(...[
                $result,
                true,
                $message
            ]);
        }
    }