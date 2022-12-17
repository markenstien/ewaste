<?php
    namespace Services;
    use Session;
    class OrderService {
        public static function startPurchaseSession(){
            $token = get_token_random_char(20);
            Session::set('purchase', $token);
            return $token;
        }

        public static function endPurchaseSession(){
            Session::remove('purchase');
        }

        public static function getPurchaseSession(){
            return Session::get('purchase');
        }
        
        public function getOrdersWithin30days($endDate) {
            $startDate30Days = date('Y-m-d',strtotime($endDate.'-30 days'));
            $orderItemModel = model('OrderItemModel');
            $items = $orderItemModel->getItemsByParam([
                'where' => [
                    'ordr.created_at' => [
                        'condition' => 'between',
                        'value' => [$startDate30Days, $endDate]
                    ]
                ]
            ]);

            return $items;
            $summary = $orderItemModel->getItemSummary($items); 
            return $summary['netAmount'];
        }

        public static function verifierCommission($amount) {
            return [
                'commissionPercentage' => '12%',
                'commissionAmount' => $amount * .18
            ];
        }
    }