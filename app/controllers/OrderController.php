<?php
    
    class OrderController extends Controller
    {
        public function __construct()
        {
            $this->model = model('OrderModel');
        }
        public function index() {
            $this->data['orders'] = $this->model->getAll();
            return $this->view('order/index', $this->data);
        }

        public function show($id) {
            csrfReload();
            $order = $this->model->getComplete($id);
            $this->data['order'] = $order['order'];
            $this->data['payment'] = $order['payment'];
            $this->data['items'] = $order['items'];

            return $this->view('order/show', $this->data);
        }

        public function voidOrder($id) {
            
            csrfValidate();
            $res = $this->model->void($id);
            Flash::set("Order Void!");
            return request(_route('order:show', $id));
        }
    }