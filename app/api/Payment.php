<?php

    class Payment extends APIController
    {

        public function __construct()
        {
            $this->payment = model('PaymentModel');
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
                $request = request()->inputs();
                parent::json([
                    'test',
                    $request,
                    $this->payment->addMultipleOrder($request)
                ]);
                // parent::json($this->payment->addMultipleOrder($request));
            }
        }
    }