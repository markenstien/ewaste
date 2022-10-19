<?php 

    class Order extends APIController
    {
        public function __construct()
        {
            parent::__construct();
            parent::validateAppUser();

            $this->order = model('OrderModel');
        }

        public function index() {
            $orders = $this->order->getAll([
                'where' => $this->inputs,
                'order' => 'orders.id desc'
            ]);

            parent::json(...[
                $orders,
                TRUE,
                'all orders'
            ]);
        }
        /**
         * checkout 
         */
        public function add() {
            if (parent::isPost()) {
                $result = $this->order->add($this->inputs);
                parent::json([
                    'isOkay' => $result
                ], true , [
                    $this->order->getMessageString(),
                    $this->order->getErrorString()
                ]);
            }
        }

        public function addFromCartItems() {
            if (parent::isPost()) {
                $result= $this->order->addFromCartItems(
                    $this->inputs['cartItemIds'],
                    $this->inputs['purchaserId']
                );

                parent::jsonResponse($result,[
                    'model' => $this->order
                ]);
            }
        }

        public function addAllCartItems() {
            if (parent::isPost()) {
                $this->cartModel = model('CartModel');
                $this->cartItemModel = model('CartItemModel');

                $cart = $cart = $this->cartModel->get([
                    'user_id' => $this->inputs['purchaserId']
                ]);

                $cartItems = $this->cartItemModel->getAll([
                    'cart_id' => $cart->id
                ]);

                $cartItemIds = [];

                foreach($cartItems as $key => $row) {
                    $cartItemIds[] = $row->id;
                }

                $result= $this->order->addFromCartItems(
                    $cartItemIds,
                    $this->inputs['purchaserId']
                );

                parent::jsonResponse($result,[
                    'model' => $this->order
                ]);
            }
        }

        // private function returnOrderData() {
        //     return [
        //         'items' => [
        //             [
        //                 'item_id' => 1,
        //                 'quantity' => 1,
        //                 'seller_id' => 2,
        //             ],
        //             [
        //                 'item_id' => 3,
        //                 'quantity' => 2,
        //                 'seller_id' => 1,
        //             ]
        //         ],
        //         'user_id' => 5,
        //         'date' => '2022-09-01'
        //     ];
        // }

        public function delete() {
            if(parent::isPost()) {
                $result = $this->order->delete($this->inputs['id']);
                parent::jsonResponse($result,[
                    'model' => $this->order
                ]);
            }
        }

        public function cancel() {
            if (parent::isPost()) {
                $result = $this->order->cancel($this->input['id'], $this->inputs['remarks']);
                parent::jsonResponse($result,[
                    'model' => $this->order
                ]);
            }
        }

        public function delivered() {
            if (parent::isPost()) {
                $result = $this->order->delivered($this->input['id']);
                parent::jsonResponse($result,[
                    'model' => $this->order
                ]);
            }
        }
    }