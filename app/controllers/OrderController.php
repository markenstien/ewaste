<?php

use Services\CategoryService;
use Services\OrderService;
    use Services\PaymentBankService;

    load(['OrderService','PaymentBankService'], SERVICES);

    class OrderController extends Controller
    {
        public function __construct()
        {
            parent::__construct();

            $this->model = model('OrderModel');
            $this->userModel = model('userModel');
            $this->item = model('ItemModel');
            $this->categoryModel = model('CategoryModel');
            $this->taxModel = model('TaxModel');
            $this->commission = model('CommissionModel');
            $this->orderService = new OrderService();
            _requireAuth();
        }

        public function index() {
            if(!$this->is_admin) {
                $this->data['orders'] = $this->model->getAll([
                    'order' => 'id desc',
                    'where' => [
                        'customer_id' => $this->data['whoIs']->id
                    ]
                ]);
            } else {
                $this->data['orders'] = $this->model->getAll([
                    'order' => 'id desc'
                ]);
            }
            return $this->view('order/index', $this->data);
        }

        public function show($id) {
            csrfReload();
            $order = $this->model->getComplete($id);
            $this->data['order'] = $order['order'];
            $this->data['payment'] = $order['payment'];
            $this->data['commission'] = $this->commission->single([
                'order_id' => $order['order']->id
            ]);
            
            $items = $order['items'];
            if($items) {
                foreach($items as $key => $row) {
                    $row->verifier = $this->userModel->get($row->is_partner_verified);
                }
            }

            $this->data['items'] = $items;
            $this->data['isCancellable'] = $this->orderService->isCancelable($order['order']);
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

                if(!$orderId) {
                    Flash::set("Something went wrong");
                    return request()->return();
                }

                $orderResponse = $this->model->retVal['orderResponse'];
                switch($post['payment_method']) {
                    case 'wallet':
                        $message = '';
                        if(upload_empty('proof_of_payment')) {
                            Flash::set("Wallet payment requires proof of payment", 'danger');
                            return request()->return();
                        }

                        $this->paymentModel = model('PaymentModel');  

                        $paymentID = $this->paymentModel->createOrUpdate([
                            'order_id' => $orderId,
                            'amount'   => $orderResponse['amount'],
                            'payment_method' => 'Online',
                        ]);

                        if(!$paymentID) {
                            Flash::set("Invalid Payment");
                            return request()->return();
                        }

                        $isUploadOk = $this->_attachmentModel->upload([
                            'display_name' => "Payment Attachment For : {$this->paymentModel->retVal['response']['reference']}",
                            'search_key' => 'PAYMENT_ATTACHMENT',
                            'global_key' => 'PAYMENT_ATTACHMENT',
                            'global_id' => $paymentID
                        ], 'proof_of_payment');

                        if($paymentID) {
                            $message .= "Payment succesfully placed";
                        }

                        if($isUploadOk) {
                            $message .= "Payment proof attached succesfully";
                        }
                        Flash::set($message);

                        return redirect(_route('order:show', $orderId));
                    break;

                    case 'bank':
                        /**
                         * bank payment
                         */
                        $paymentService = PaymentBankService::getInstance();
                        $returnURL = URL.'/'._route('payment:bank-payment', null, [
                            'platform' => 'paypal',
                            'orderID' => seal($orderId),
                            'response' => 'Success'
                        ]);
                        $cancelURL = URL.'/'._route('payment:bank-payment', null, [
                            'platform' => 'paypal',
                            'response' => 'Cancel',
                            'orderID' => seal($orderId),
                        ]);

                        $purchase = $paymentService->purchase([
                            'amount' => $orderResponse['amount'],
                            'currency' => 'PHP',
                            'returnURL' => $returnURL,
                            'cancelURL' => $cancelURL
                        ])->send();
                            
                        if ($purchase->isRedirect()) {
                            // redirect to offsite payment gateway
                            $purchase->redirect();
                        } elseif ($purchase->isSuccessful()) {
                            // payment was successful: update database
                            print_r($purchase);
                        } else {
                            // payment failed: display message to customer
                            echo $purchase->getMessage();
                        }
                    break;

                    case 'cod':
                        Flash::set("Order confirmed");
                        return redirect(_route('order:show', $orderId));
                        break;
                }
            }
            $this->data['taxPercentage'] = $this->taxModel->current();
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

        public function cancellation($orderId) {
            
            if(isSubmitted()) {
                $post = request()->posts();
                if(isEqual($post['reason_id'], '_others_') && empty($post['reason_others'])) {
                    Flash::set("Reason must not be empty","danger");
                    return request()->return();
                } else {
                    ///check if reason exists.
                    $isReasonExist = $this->categoryModel->single([
                        'name' => $post['reason_others'],
                        'category' => CategoryService::CANCEL_REASON
                    ]);

                    if(!$isReasonExist) {
                        $reasonId = $this->categoryModel->store([
                            'name' => $post['reason_others'],
                            'category' => CategoryService::CANCEL_REASON
                        ]);
                        $post['reason_id'] = $reasonId;
                    }else{
                        $post['reason_id'] = $isReasonExist->id;
                    }
                }

                $res = $this->model->cancellation($post);

                if($res) {
                    Flash::set($this->model->getMessageString());
                }else{
                    Flash::set($this->model->getErrorString(),'danger');
                }

                return redirect(_route('order:show', $post['order_id']));
            }

            $this->data['order'] = $this->model->get($orderId);
            $this->data['reasons'] = OrderService::cancellationReasons();
            $this->data['id'] = $orderId;
            return $this->view('order/cancellation', $this->data);
        }
    }