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
            $request = request()->inputs();
            if (!isSubmitted()) {
                $data = [
                    'user_id' => 1,
                    'item_id' => 2,
                    'quantity' => 1
                ];
                $this->cart->add($data);
            }
        }
    }