<?php 
    class Category extends APIController
    {

        public function __construct()
        {
            parent::__construct();

            // parent::validateAppUser();
            $this->categoryModel = model('CategoryModel');
        }

        public function add() {
                
            if(isSubmitted()) {
                $res = $this->categoryModel->createOrUpdate($this->inputs);
                return parent::json(...[
                    ['categoryId' => $res],
                    TRUE,
                    $this->categoryModel->getMessageString()
                ]);
            }
        }
    }