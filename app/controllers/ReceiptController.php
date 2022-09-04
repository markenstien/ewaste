<?php

    class ReceiptController extends Controller
    {

        public function __construct()
        {
            $this->order = model('OrderModel');
        }

        public function index() {

        }

        public function orderReceipt($id) {

            $order = $this->order->getComplete($id);

            if(!$order) {
                return false;
            }

            $this->data['order'] = $order['order'];
            $this->data['payment'] = $order['payment'];
            $this->data['items'] = $order['items'];
            return $this->view('receipt.order_receipt', $this->data);
        }
    }