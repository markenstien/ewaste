<?php
    class ProductVerifier extends APIController
    {

        public function __construct()
        {
            parent::__construct();
            $this->productModel = model('ItemModel');
        }

        /**
         * verifier_id,
         * product_id
         */
        public function verify() {
            if (parent::isPost()) {
                $response = $this->productModel->verify(
                    ...[
                        $this->inputs['verifier_id'],
                        $this->inputs['item_id'],
                        $this->inputs['remarks']
                    ]
                );
    
                parent::jsonResponse([
                    'isOkay' => $response
                ], [
                    'model' => $this->productModel
                ]);
            }
        }
    }