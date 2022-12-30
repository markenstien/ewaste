<?php 

    class Test extends APIController
    {
        public function __construct()
        {
            parent::__construct();
            $this->userModel = model('UserModel');
        }
        
        public function post() {
            if(parent::isPost()) {
                $post = $this->inputs;
                parent::json($post, true, "POST-TEST-SUCCESS");
            }    
        }

        public function get() {
            $post = $this->inputs;
            $post['users'] = $this->userModel->getAll();
            parent::json($post, true , 'GET-TEST-SUCCESS');
        }

        public function restPostCall() {
            $url = URL.'/api/order/delete';
            $inputs = null;

            //add stock

            $url = URL.'/api/productVerifier/verify';
            $inputs = [
                'verifier_id' => 2,
                'item_id' => 5,
                'remarks' => 'i verified it!'
            ];

            // $param = [
            //     'postData' => json_encode($inputs)
            // ];

            dump(
                api_call('POST', $url, $inputs)
            );
        }
    }