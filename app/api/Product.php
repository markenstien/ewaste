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
            } else {
                $fetchCondition = [];
                if(!empty($this->inputs)) {
                    foreach($this->inputs as $key => $row) {
                        if(empty($row)) continue;
                        $fetchCondition[$key] = [
                            'condition' => 'like',
                            'concatinator' => 'AND',
                            'value' => "%{$row}%"
                        ];
                    } 
                }

                $data = $this->itemModel->all($fetchCondition);
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
            if(parent::isPost()) {
                $result = $this->itemModel->createOrUpdate($this->inputs, $this->inputs['id']);
                parent::json([
                    'isOkay' => $result
                ], true, [
                    $this->itemModel->getMessageString(),
                    $this->itemModel->getErrorString()
                ]);
            }
        }

        public function delete() {
            if(parent::isPost()) {
                $result = $this->itemModel->delete($this->inputs['id']);
                parent::json([
                    'isOkay' => $result
                ], true, [
                    $this->itemModel->getMessageString(),
                    $this->itemModel->getErrorString()
                ]);
            }
        }
        
    }