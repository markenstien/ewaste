<?php

    use Classes\Entity\Cart as EntityCart;
    load(['Cart'],CLASSES.DS.'Entity');

    class Cart extends APIController
    {
        public function __construct()
        {
            parent::__construct();
            $this->cart = model('CartModel');
            $this->cartItem = model('CartItemModel');
            $this->productModel = model('ItemModel');
            $this->cartEntity = new EntityCart;
        }

        public function index() {
            $userId = $this->request->get('userId');
            $carts = $this->cart->getCart($userId);

            $carItems = $carts->items;
            $carItems = $this->productModel->appendImages($carItems,"URL_ONLY");
            $carts = $this->cartEntity->convertItems($carItems);
            parent::json($carts);
        }

        public function addItem() {
            $request = $this->inputs;
            if (parent::isPost()) {
                $data = [
                    'user_id' => $request['userId'],
                    'item_id' => $request['itemId'],
                    'quantity' => $request['quantity']
                ];
                $cartId = $this->cart->add($data);

                parent::json([
                    'responseId' => $cartId,
                    'cartData' => $data
                ]);
            }
        }

        public function delete() {

            if(parent::isPost()) {
                $isDeleted = $this->cartItem->delete($this->inputs['id']);
                parent::json([
                    'isDeleted' => $isDeleted,
                    'cartId' => $this->inputs['id']
                ]);
            }
        }
    }