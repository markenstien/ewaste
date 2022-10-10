<?php

use Mpdf\Tag\P;
use Services\OrderService;
    use Services\StockService;

    load(['OrderService', 'StockService'],SERVICES);
    class OrderModel extends Model
    {
        public $table = 'orders';

        public function add($order) {
            if(!isset($order['items']) || empty($order['items'])) {
                $this->addError("There are no items found!");
            }

            if(!empty($this->getErrors())) 
                return false;

            $this->itemModel = model('ItemModel');
            $this->orderItemModel = model('OrderItemModel');
            $this->stockModel = model('StockModel');
            $this->cart = model('CartModel');

            $items = $order['items'];
            $customerId = $order['user_id'];
            $orders = [];
            $orderDataByMerch = [];

            //group items by merchant
            foreach ($items as $key => $row) {
                if ($row['quantity'] > 0) {
                    //check item quantit
                    // $isQuantityOkay = $this->itemModel->checkQuantity($row['item_id'], $row['quantity']);
                    $isQuantityOkay = true;
                    if(!$isQuantityOkay) {
                        //skip item
                        $this->addError($this->itemModel->getErrorString());
                        continue;
                    } else {
                        if (empty($this->getErrors())) {
                            $sellerId = $row['seller_id'];
                                if (!isset($orderDataByMerch[$sellerId])) {
                                    $orderDataByMerch[$sellerId] = [];
                                }
                                //delete item on cart
                                $this->cart->deleteByItem(...[
                                    $row['item_id'], $customerId
                                ]);
                            array_push($orderDataByMerch[$sellerId], $row);
                        }
                    }
                }
            }

            if(!empty($this->getErrors())) {
                return false;
            }

            //create different orders by different merchants
            foreach ($orderDataByMerch as $sellerId => $items) {
                $orderReference = referenceSeries(parent::lastId(), 5, date('y-m').'-');
                $totalAmount = 0;
                $orderItems = [];
                $orderInstance = [
                    'reference' => $orderReference,
                    'seller_id' => $sellerId,
                    'customer_id' => $customerId,
                    'created_at'  => today(),
                    'status' => 'pending'
                ];

                foreach ($items as $key => $item) {
                    $itemInfo = $this->itemModel->get($item['item_id']);
                    $totalAmount += $itemInfo->sell_price * $item['quantity'];
                    //deduct item stock
                    $this->stockModel->createOrUpdate([
                        'item_id' => $item['item_id'],
                        'quantity' => $item['quantity'],
                        'entry_type' => StockService::ENTRY_DEDUCT,
                        'entry_origin' => StockService::SALES,
                        'remarks' => 'SOLD #' . $orderReference,
                        'date' => today()
                    ]);

                    $item['price'] = $itemInfo->sell_price;
                    array_push($orderItems, $item);
                }

                $orderInstance['net_amount'] = $totalAmount;
                $orderInstance['gross_amount'] = $totalAmount;

                $orderId = parent::store($orderInstance);
                $addedItems = $this->orderItemModel->addItems($orderId, $orderItems);
            }

            return [
                'orders' => $orders,
                'orderDataByMerch' => $orderDataByMerch,
                'orderId' => $orderId,
                'addedItems' => $addedItems
            ];
        }

        public function getComplete($id) {
            $orders = $this->getAll([
                'where' => [
                    'orders.id' => $id
                ]
            ]);

            if($orders) {
                $order = $orders[0];
            }else{
                $this->addError('order not found!');
                return false;
            }
            if(!$order) {
                $this->addError("order not found!");
                return false;
            }

            $this->payment = model('PaymentModel');
            $this->orderItem = model('OrderItemModel');
            
            $payment = $this->payment->getOrderPayment($id);
            $items = $this->orderItem->getOrderItems($id);

            return [
                'order' => $order,
                'payment' => $payment,
                'items'  => $items
            ];
        }

        /**
         * for changes
         */
        public function placeAndPay($orderData, $paymentData){

            if (!isset($orderData['id'])) {
                $this->addError("Order does not exists...");
                return false;
            }

            $this->payment = model('PaymentModel');
            $this->item = model('OrderItemModel');

            $orderData['date_time'] = now();
            $orderData['staff_id'] = whoIs('id');
            $orderData['is_paid'] = true;
            $orderDataUpdate = parent::update($orderData, $orderData['id']);
            $paymentId = $this->payment->createOrUpdate($paymentData);
            if($orderDataUpdate && $paymentId) {
                $this->addMessage("Order and payment saved");
                //remove stocks
                $items = $this->item->getOrderItems($orderData['id']);

                foreach ($items as $key => $row) {
                    $this->item->deductStock($row->item_id, $row->quantity);
                }
                return true;
            }

            $this->addError("Something went wrong!");
            return false;
        }

        public function getAll($params = []) {
            $this->orderItemModel = model('OrderItemModel');
            $where = null;
            $order = null;
            $limit = null;

            if(isset($params['where']) && !empty($params['where'])) {
                if(isset($params['where']['id'])) {
                    $params['where']['orders.id'] = is_array($params['where']['id']) ?
                        $params['where']['id']['value'] : $params['where']['id'];
                    unset($params['where']['id']);
                }
                $where = " WHERE ".parent::conditionConvert($params['where']);
            }
            if(isset($params['order']) && !empty($params['order'])) {
                $order = " ORDER BY ".$params['order'];
            }
            if(isset($params['limit']) && !empty($params['limit'])) {
                $limit = " LIMIT {$params['limit']}";
            }

            $this->db->query(
                "SELECT orders.*, 
                    concat(seller.firstname, ' ', seller.lastname) as seller_name,
                    seller.email as seller_email, 
                    seller.phone as seller_phone, 
                    seller.profile as seller_profile_picture,
                    seller.address as seller_address,

                    concat(customer.firstname , ' ', customer.lastname) as customer_name,
                    customer.email as customer_email,
                    customer.phone as customer_phone,
                    customer.profile as customer_profile_picture,
                    customer.address as customer_address


                    FROM {$this->table}
                    LEFT JOIN users as seller 
                    ON seller.id = orders.seller_id 
                    
                    LEFT JOIN users as customer
                    ON customer.id = orders.customer_id
                    {$where} {$order} {$limit}
                "
            );

            $orders = $this->db->resultSet();

            if($orders) {
                $this->paymentModel = model('PaymentModel');
                foreach($orders as $key => $row) {
                    $row->items = $this->orderItemModel->getOrderItems($row->id);
                    $row->payment = $this->paymentModel->get([
                        'order_id' => $row->id
                    ]);
                }
            }
            return $orders;
        }
        //convert to order 
        public function addFromCartItems($cartItemIds = [], $purchaserId) {

            if (empty($cartItemIds)) {
                $this->addError("Cart Items not found!");
                return false;
            }

            $this->cartItemModel = model('CartItemModel');

            $cartItems = $this->cartItemModel->getAll([
                'where' => [
                    'cart_item.id' => [
                        'condition' => 'in',
                        'value' => $cartItemIds
                    ]
                ]
            ]);

            if(empty($cartItems)) {
                $this->addError("Cart Items not found!");
                return false;
            }

            $orderItems = [
                'items' => [],
                'user_id' => $purchaserId,
                'date' => now()
            ];
            //prepare cart-item-to-orders
            foreach($cartItems as $key => $cartItem) {
                array_push($orderItems['items'], [
                    'item_id' => $cartItem->id,
                    'quantity' => $cartItem->quantity,
                    'seller_id' => $cartItem->product_owner_id
                ]);
            }
            //use order
            return $this->add($orderItems);
        }
        /**
         * delete order id 
         * items and payments
         */
        public function delete($id) {
            $order = parent::get($id);
            if(!$order) {
                $this->addError("Order not found");
                return false;
            }
            $this->paymentModel = model('PaymentModel');
            $this->orderItemModel = model('OrderItemModel');
            //payment deleted
            $this->paymentModel->delete([
                'order_id' => $id
            ]);
            $this->orderItemModel->delete([
                'order_id' => $id
            ]);

            $result = parent::delete($id);

            if(!$result) {
                $this->addError("Unable to delete order.");
            }
            
            return $result;
        }

        public function cancel($orderId, $remarks = 'ORDER CANCELLED') {
            $result = parent::update([
                'remarks' => $remarks,
                'status' => 'cancelled'
            ], $orderId);

            if(!$result) {
                $this->addError("Order failed to cancel.");
                return false;
            }
            $this->addError("Order has been cancelled");
            return true;
        }

        public function delivered($id) {
            return parent::update([
                'is_delivered' => true
            ], $id);
        }
    }