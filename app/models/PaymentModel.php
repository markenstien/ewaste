<?php

    class PaymentModel extends Model
    {
        public $table = 'payments';
        public $_fillables = [
            'order_id',
            'reference',
            'amount',
            'payment_method',
            'payer_name',
            'mobile_number',
            'address',
            'remarks',
            'organization',
            'account_number',
            'external_reference',
            'created_by'
        ];

        public function createOrUpdate($paymentData, $id = null) {
            $_fillables = parent::getFillablesOnly($paymentData);

            if (!is_null($id)) {
                return parent::update($_fillables, $id);
            } else {
                $_fillables['reference'] = $this->generateRefence();
                return parent::store($_fillables);
            }
        }

        public function addMultipleOrder($paymentData) {
            
            if(!isset($paymentData['orders'])) {
                return false;
            }

            $this->orderModel = model('OrderModel');
            $retVal = [];
            $orders = $paymentData['orders'];

            $payment = $paymentData['payment'];
            $ordersInfo = $this->orderModel->all([
                'id' => [
                    'condition' => 'in',
                    'value' => $orders
                ]
            ]);

            $total = 0;
            foreach($ordersInfo as $key => $row) {
                $total += $row->net_amount;
            }

            if($total < $payment['amount']) {
                $this->addError("Insuficient Payment");
                return false;
            }

            foreach($ordersInfo as $key => $row) {
                $paymentData = array_merge($payment, [
                    'amount' => $row->net_amount,
                    'order_id' => $row->id,
                ]);

                $paymentId = $this->createOrUpdate($paymentData);
                
                if($paymentId) {
                    $retVal['paymentData'][] = $paymentData;
                    $retVal['paymentId'][] = $paymentId;

                    $this->orderModel->update([
                        'is_paid' => true
                    ], $row->id);
                }
                
            }

            $retVal['orders'] = $orders;
            $retVal['payment'] = $payment;
            $retVal['payment'] = $payment;
            $retVal['totaal'] = $total;

            return $retVal;
        }

        public function getOrderPayment($id) {
            return parent::single(['order_id'=>$id]);
        }

        public function generateRefence() {
            return number_series(random_number(7));
        }
    }