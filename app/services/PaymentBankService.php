<?php 
    namespace Services;
    use Omnipay\Omnipay;
    require_once LIBS.DS.'payment_gateway/vendor/autoload.php';

    class PaymentBankService 
    {
        public static $instance = null;

        public static function getInstance() {
            if(self::$instance == null) {
                $gateway = Omnipay::create('PayPal_Rest');
                $gateway->setClientId(THIRD_PARTY['paypal']['clientID']);
                $gateway->setSecret(THIRD_PARTY['paypal']['secret']);
                $gateway->setTestMode(true);
                self::$instance = $gateway;
            }
            return self::$instance;
        }
    }