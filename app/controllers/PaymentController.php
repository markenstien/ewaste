<?php
    use Form\PaymentForm;
    use Omnipay\Omnipay;
    use Services\PaymentBankService;

    require_once LIBS.DS.'payment_gateway/vendor/autoload.php';
    load(['PaymentForm'], FORMS);
    load(['PaymentBankService'], SERVICES);

    class PaymentController extends Controller
    {
        public function __construct()
        {
            parent::__construct();
            $this->model = model('PaymentModel');
            $this->orderModel = model('OrderModel');
            $this->data['_form'] = new PaymentForm();

        }

        public function create(){
            $req = request()->inputs();

            if(isSubmitted()) {
                $post = request()->posts();
                $paymentId = $this->model->createOrUpdate($post);

                if($paymentId) {
                    Flash::set("Payment created");
                    $this->orderModel->toPaid($post['order_id']);
                    return redirect(_route('order:show', $post['order_id']));
                } else {

                }
            }

            $orderComplete = $this->orderModel->getComplete($req['order_id']);
            $order = $orderComplete['order'];

            $paymentForm = $this->data['_form'];

            $paymentForm->setValue('amount', $order->net_amount);
            $paymentForm->setValue('order_id', $order->id);
            $this->data['order'] = $order;

            return $this->view('payment/create', $this->data);
        }
        public function index() {
            $this->data['payments'] = $this->model->all(['is_removed' => false, 'id desc']);
            return $this->view('payment/index', $this->data);
        }

        public function show($id) {
            $this->data['payment'] = $this->model->get($id);
            return $this->view('payment/show', $this->data);
        }

        public function onlinePaymentResponse() {
            $gateway = $this->initPaypalPayment();
            $req = request()->get();

            if (isset($req['paymentId'], $req['PayerID'])) {
                $transaction = $gateway->completePurchase(array(
                    'payer_id' => $req['PayerID'],
                    'transactionReference' => $req['paymentId'],
                ));

                $response = $transaction->send();

                if($response->isSuccessful()) {
                    $responseData = $response->getData();
                    Flash::set("Payment Succesfful");
                }
            }
        }

        public function bankPayment() {
            $gateway = PaymentBankService::getInstance();
            $req = request()->get();

            $orderId = unseal($req['orderID']);

            if(!isEqual($req['response'], 'Cancel'))
            {
                switch($req['platform']) {
                    case 'paypal':
                        if (isset($req['paymentId'], $req['PayerID'])) {
                            $transaction = $gateway->completePurchase(array(
                                'payer_id' => $req['PayerID'],
                                'transactionReference' => $req['paymentId'],
                            ));
            
                            $response = $transaction->send();
            
                            if($response->isSuccessful()) {
                                $responseData = $response->getData();
                                $orderId = unseal($req['orderID']);
                                $order = $this->orderModel->get($orderId);
                                
                                $response = $this->model->createOrUpdate([
                                    'order_id' => unseal($req['orderID']),
                                    'payment_method' => $req['ONLINE'],
                                    'amount' => $order->net_amount,
                                    'organization' => $req['platform'],
                                    'external_reference' => $responseData->id
                                ]);
    
                                if($response) {
                                    Flash::set("Payment Approved");
                                    $this->orderModel->toPaid($orderId);
                                    return redirect(_route('order:show', $orderId));
                                } else {
                                    Flash::set("Something went wrong!");
                                    return redirect(_route('item:catalog'));
                                }
                            }
                        }
                    break;
                }
            } else {
                Flash::set("Payment Cancelled", 'danger');
                return redirect(_route('order:show', $orderId));
            }
            
        }
        

        public function onlinePayment() {
            // https://github.com/thephpleague/omnipay-paypal
            // https://github.com/thephpleague/omnipay

            // $gateway = Omnipay::create('PayPal_Express');
            // $gateway->setUsername('andreiaetorma@business.example.com');
            // $gateway->setPassword('sandbox123andreia');

            $gateway = $this->initPaypalPayment();

            $response = $gateway->purchase(array(
                'amount' => 3.00,
                'currency' => 'USD',
                'returnURL' => 'http://dev.ewaste/PaymentController/onlinePaymentResponse?response=success',
                'cancelURL' => 'http://dev.ewaste/PaymentController/onlinePaymentResponse?response=unsuccessful',
            ))->send();

            if ($response->isRedirect()) {
                // redirect to offsite payment gateway
                $response->redirect();
            } elseif ($response->isSuccessful()) {
                // payment was successful: update database
                print_r($response);
            } else {
                // payment failed: display message to customer
                echo $response->getMessage();
            }

            dd([
                $response->getMessage()
            ]);
        }

        private function initPaypalPayment() {
            $gateway = Omnipay::create('PayPal_Rest');
            $gateway->setClientId(THIRD_PARTY['paypal']['clientID']);
            $gateway->setSecret(THIRD_PARTY['paypal']['secret']);
            $gateway->setTestMode(true);

            return $gateway;
        }
    }