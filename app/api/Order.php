<?php 

    class Order extends APIController
    {
        public function __construct()
        {
            parent::__construct();
            parent::validateAppUser();

            $this->order = model('OrderModel');
        }


        /**
         * data stucture
            //$post = [
            //     'items' => [
            //         ['item_id' => 1, 'quantity' => 3, 'seller_id' => 2],
            //         ['item_id' => 2, 'quantity' => 1, 'seller_id' => 1],
            //     ],
            //     'user_id' => 1,
            //     'date' => '2022/03/28',
            //     'discounts' => [
            //         ['name' => 'student discount 30%', 'amount' => 30]
            //     ]
            // ];
         */

        public function index() {
            $orders = $this->order->getAll();
            parent::json(...[
                $orders,
                TRUE,
                'all orders'
            ]);
        }
        public function add() {
            /**
             * post values
             */

            $result = $this->order->add($this->returnOrderData());
            parent::json($result);
            // $post = request()->inputs();

            // if(isSubmitted()) {
            //     $this->order->add($this->returnOrderData());
            // }
        }

        private function returnOrderData() {
            return [
                'items' => [
                    [
                        'item_id' => 1,
                        'quantity' => 1,
                        'seller_id' => 2,
                    ],
                    [
                        'item_id' => 3,
                        'quantity' => 2,
                        'seller_id' => 1,
                    ]
                ],
                'user_id' => 5,
                'date' => '2022-09-01'
            ];
        }
    }