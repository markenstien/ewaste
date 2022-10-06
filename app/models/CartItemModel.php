<?php

    class CartItemModel extends Model
    {
        public $table = 'cart_items';

        public function addOrDeduct($data) {
            $cartItem = parent::get($data['id']);
            $quantity = $cartItem->quantity;
            if($data['type'] == 'deduct') {
                if($quantity > 2) {
                    $quantity -= 1;
                }else{
                    //error
                }
            }else{
                $quantity++;
            }

            return parent::update([
                'quantity' => $quantity
            ], $data['id']);
        }

        public function addItem($cartId, $itemId, $quantity) {
            //check if product already exists then update qty
            $item = $this->getByItem($cartId, $itemId);

            if ($item) {
                return parent::update([
                    'quantity' => $quantity,
                    'date_created' => date('Y-m-d H:i:s A')
                ], [
                    'cart_id' => $cartId,
                    'item_id' => $itemId
                ]);
            } else {
                return parent::store([
                    'cart_id' => $cartId,
                    'item_id' => $itemId,
                    'quantity' => $quantity,
                    'date_created' => date('Y-m-d H:i:s A')
                ]);
            }
        }

        public function getByItem($cartId, $itemId) 
        {
            $item = $this->getItems($cartId, [
                'cart_item.item_id' => $itemId
            ]);

            return $item ? $item[0] : false;
        }

        public function getItems($cartId, $otherParams = []) {

            $where = [
                'cart_item.cart_id' => $cartId 
            ];

            if(!empty($otherParams)) {
                $where = array_merge($where, $otherParams);
            }

            $where = " WHERE " . parent::conditionConvert($where);

            $this->db->query(
                "SELECT item.*, cart_item.id as cart_item_id,
                    quantity,cart_item.date_created as cart_item_date,
                    category.name as category_name
                    FROM {$this->table} as cart_item

                    LEFT JOIN items as item 
                    ON item.id = cart_item.item_id

                    LEFT JOIN categories as category
                    ON category.id = item.category_id
                    {$where} "
            );

            return $this->db->resultSet();
        }

    }