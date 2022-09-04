<?php 

    class CartModel extends Model
    {
        public $table = 'carts';

        public function initUser($userId) {
            $cart = $this->getCart($userId);

            if(!$cart) {
                parent::store([
                    'user_id' => $userId
                ]);
                $cart = $this->getCart($userId); 
            }
            return $cart;
        }

        public function getCart($userId) {
            $cart = parent::single([
                'user_id' => $userId
            ]);
            
            if(!$cart)
                return $cart;
            //get items
            $cartItemModel = model('CartItemModel');
            $cartItems = $cartItemModel->getItems($cart->id);
            $cart->items = $cartItems;

            return $cart;
        }

        public function add($itemData) {
            $cart = $this->initUser($itemData['user_id']);
            $cartItemModel = model('CartItemModel');

            return $cartItemModel->addItem(...[
                $cart->id,
                $itemData['item_id'],
                $itemData['quantity']
            ]);
        }

        public function deleteByItem($item_id,$user_id) {
            $this->db->query(
                "DELETE
                    FROM cart_items where
                    item_id = '{$item_id}'
                    AND cart_items.cart_id 
                        = (SELECT id from carts where user_id = '{$user_id}') "
            );
            return $this->db->execute();
        }
    }