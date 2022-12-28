<?php
    use Form\PaymentForm;
    use Omnipay\Omnipay;

    require_once LIBS.DS.'payment_gateway/vendor/autoload.php';
    load(['PaymentForm'], FORMS);

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

        public function onlinePayment() {
            $gateway = Omnipay::create('PayPal_Rest');
            $gateway->setClientId('123123');
            $gateway->setSecret('123123');
            $gateway->setTestMode(true);

            $response = $gateway->purchase(array(
                'amount' => 3.00,
                'currency' => 'PHP',
                'returnURL' => 'return_url',
                'cancelURL' => 'cancel_url',
            ))->send();
        }
    }