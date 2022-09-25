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
    }