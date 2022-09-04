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

        }

        public function add() {

            if($saveId = $this->stockModel->createOrUpdate($this->inputs)) {
                parent::json(... [
                    ['entryId' => $saveId],
                    TRUE,
                    $this->stockModel->getMessageString()
                ]);
            }
        }

        public function edit() {

        }

        public function delete() {

        }

        public function logs() {
            parent::json($this->stockModel->getProductLogs($this->inputs['item_id']));
        }
    }