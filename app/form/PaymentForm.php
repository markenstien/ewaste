<?php
    namespace Form;
    use Core\Form;
    load(['Form'],CORE);

    class PaymentForm extends Form
    {
        public function __construct()
        {
            parent::__construct();
            $this->name = 'payment_form';

            $this->init([
                'url' => _route('payment:create'),
            ]);

            // $this->addName();
            // $this->addMobileNumber();
            // $this->addAddress();
            // $this->addRemarks();
            $this->addPaymentMethod();
            $this->addOrderId();
            $this->addAmount();

            $this->customSubmit('Save Payment');
        }
        
        public function addOrderId() {
            $this->add([
                'type' => 'hidden',
                'name' => 'order_id'
            ]);
        }

        public function addName() {
            $this->add([
                'type' => 'text',
                'name' => 'payer_name',
                'class' => 'form-control',
                'options' => [
                    'label' => 'Customer name'
                ]
            ]);
        }

        public function addMobileNumber() {
            $this->add([
                'type' => 'text',
                'name' => 'mobile_number',
                'class' => 'form-control',
                'options' => [
                    'label' => 'Mobile Number'
                ]
            ]);
        }

        public function addAddress() {
            $this->add([
                'type' => 'textarea',
                'name' => 'address',
                'class' => 'form-control',
                'options' => [
                    'label' => 'Address'
                ]
            ]);
        }

        public function addRemarks() {
            $this->add([
                'type' => 'textarea',
                'name' => 'remarks',
                'class' => 'form-control',
                'options' => [
                    'label' => 'Remarks'
                ]
            ]);
        }

        public function addPaymentMethod() {
            $this->add([
                'type' => 'select',
                'name' => 'payment_method',
                'class' => 'form-control',
                'options' => [
                    'label' => 'Payment Method',
                    'option_values' => [
                        'ONLINE','CASH'
                    ]
                ],
                'attributes' => [
                    'id' => 'payment_method'
                ],
                'value' => 'CASH'
            ]);
        }


        public function addAmount() {
            $this->add([
                'type' => 'text',
                'name' => 'amount',
                'class' => 'form-control',
                'options' => [
                    'label' => 'Amount'
                ],
                'attributes' => [
                    'required' => true,
                    'readonly' => true
                ]
            ]);
        }
    }