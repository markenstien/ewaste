<?php 

    class Cart extends Controller
    {
        public function __construct()
        {
            parent::__construct();
            $this->cart = model('CartModel');
            $this->cartItem = model('CartItemModel');
        }

        public function index() {
            $carts = $this->cart->getCart(1);
            dd($carts);
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