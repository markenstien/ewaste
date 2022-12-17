<?php

    use Services\OrderService;
    load(['OrderService'], SERVICES);

    class OrderController extends Controller
    {
        public function __construct()
        {
            parent::__construct();

            $this->model = model('OrderModel');
            $this->userModel = model('userModel');
            $this->item = model('ItemModel');

            $this->orderService = new OrderService();
        }
        public function index() {
            $this->data['orders'] = $this->model->getAll([
                'order' => 'id desc'
            ]);
            return $this->view('order/index', $this->data);
        }

        public function show($id) {
            csrfReload();
            $order = $this->model->getComplete($id);
            $this->data['order'] = $order['order'];
            $this->data['payment'] = $order['payment'];

            $items = $order['items'];
            if($items) {
                foreach($items as $key => $row) {
                    $row->verifier = $this->userModel->get($row->is_partner_verified);
                }
            }

            $this->data['items'] = $items;
            $this->data['orderService'] = $this->orderService;

            return $this->view('order/show', $this->data);
        }

        public function voidOrder($id) {
            csrfValidate();
            $res = $this->model->void($id);
            Flash::set("Order Void!");
            return request(_route('order:show', $id));
        }

        public function buyNow() {
            $req = request()->inputs();

            if(isSubmitted()) {
                $post = request()->posts();
                $orderId = $this->model->singleOrder($post);

                if($orderId) {
                    Flash::set("Order confirmed");
                    return redirect(_route('order:show', $orderId));
                } else {
                    Flash::set("Something went wrong");
                    return request()->return();
                }
            }

            $itemId = $req['productId'];

            $item = $this->item->get($itemId);
            $item->images = $this->item->getImages($itemId);

            $this->data['item'] = $item;
            $this->data['user'] = $this->userModel->get($this->data['whoIs']->id);
            return $this->view('order/buy_now' , $this->data);
        }

        public function delivered($id) {
            $this->model->delivered($id);
            Flash::set("Order delivered");
            return redirect(_route('order:show', $id));
        }
    }