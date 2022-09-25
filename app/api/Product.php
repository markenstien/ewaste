<?php
    load(['Product'], CLASSES.DS.'Entity');

    class Product extends APIController
    {
        public function __construct()
        {
            parent::__construct();
            parent::validateAppUser();
            $this->itemModel = model('ItemModel');
            $this->productEntity = new Classes\Entity\Product;
        }

        public function index() {
            $data = null;
            if (isset($this->inputs['id'])) {
                $data = $this->itemModel->get($this->inputs['id']);
            } else if(isset($this->inputs['keyword'])) {
                $keyword = $this->inputs['keyword'];
                $where = $this->itemModel->conditionConvert([
                    'name' => $keyword,
                    'variant' => $keyword
                ], 'like' , 'OR');
                $data = $this->itemModel->all($where);
            } else if(isset($this->inputs['adv'])) {
                $data = $this->itemModel->all($this->itemModel->getFillablesOnly($this->inputs));
            }else {
                $data = $this->itemModel->all();
            }

            if($data) {
                $data = $this->itemModel->appendImages($data,'URL_ONLY');
            }
            $data = $this->productEntity->convertItems($data);
            
            parent::json($data);
        }

        public function add() {
            if($productId = $this->itemModel->createOrUpdate($this->inputs)) {
                parent::json(...[
                    ['productId' => $productId],
                    TRUE,
                    $this->itemModel->getErrorString()
                ]);
            } else {
                parent::json(...[
                    null,
                    FALSE,
                    ERROR_MESSAGE
                ]);
            }
        }

        public function edit() {

        }

        public function delete() {

        }
    }