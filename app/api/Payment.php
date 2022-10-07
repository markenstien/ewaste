<?php

    class Payment extends APIController
    {

        public function __construct()
        {
            parent::__construct();
            $this->payment = model('PaymentModel');
        }

        public function index() {
            parent::json(
                $this->payment->all()
            );
        }
        /**
         * 
         */
        public function add() {
            // $post = [
            //     'orders' => [
            //         1,2
            //     ],
            //     'payment' => [
            //         'amount' => 8000,
            //         'payment_method' => 'CASH',
            //         'mobile_number' => '09063387451'
            //     ]
            // ];

            if (isSubmitted()) {
                $result = $this->payment->addMultipleOrder($this->inputs);
                parent::json([
                    'isOkay' => $result
                ], true, [
                    $this->payment->getMessageString(),
                    $this->payment->getErrorString()
                ]);
            }
        }

        public function delete() {
            $result = $this->payment->delete($this->inputs['id']);

            parent::json([
                'isOkay' => $result
            ], true, [
                $this->payment->getMessageString(),
                $this->payment->getErrorString()
            ]);
        }

        public function approve() {
            if(parent::isPost()) {
                $result = $this->payment->approve($this->inputs['id']);
                $this->jsonResponse($result, [
                    'model' => $this->payment
                ]);
            }
        }
    }