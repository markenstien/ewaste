<?php 

    class Inventory extends APIController
    {

        public function __construct()
        {
            parent::__construct();
            parent::validateAppUser();

            $this->stockModel = model('StockModel');
        }

        public function index(){
            parent::json($this->stockModel->getStocks());
        }

        public function add() {
            /**
             * data
             * item_id, quantity, remarks, date,pruchase order
             * entry_type, entry origin, created_by
             */
            if($saveId = $this->stockModel->createOrUpdate($this->inputs)) {
                parent::json(... [
                    ['entryId' => $saveId],
                    TRUE,
                    $this->stockModel->getMessageString()
                ]);
            }
        }
        /**
         * disable edit
         */

        public function edit() {

        }

        public function delete() {
            if(parent::isPost()) {
                $response = $this->stockModel->delete($this->inputs['id']);
                parent::json([
                    'isOkay' => $response
                ], true, [
                    $this->stockModel->getMessageString(),
                    $this->stockModel->getErrorString()
                ]);
            }
        }
        
        public function logs() {
            parent::json($this->stockModel->getProductLogs($this->inputs['item_id']));
        }
    }