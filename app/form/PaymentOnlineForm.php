<?php
    namespace Form;
    use Core\Form;
    load(['Form'],CORE);

    class PaymentOnlineForm extends Form
    {

        public function __construct($name = '')
        {
            parent::__construct();
            $this->name = empty($name) ? 'payment_online_form' : $name;

            $this->addOrganization();
            $this->addReference();
            $this->addAccountNumber();
            $this->addAccountName();
            $this->addRemarks();
        }

        public function addOrganization() {
            $this->add([
                'name' => 'organization',
                'type' => 'text',
                'options' => [
                    'label' => 'Organizaiton'
                ],
                'class' => 'form-control'
            ]);
        }

        public function addAccountNumber() {
            $this->add([
                'name' => 'account_number',
                'type' => 'text',
                'options' => [
                    'label' => 'Account Number'
                ],
                'class' => 'form-control'
            ]);
        }

        public function addAccountName() {
            $this->add([
                'name' => 'account_name',
                'type' => 'text',
                'options' => [
                    'label' => 'Account Name'
                ],
                'class' => 'form-control'
            ]);
        }

        public function addReference() {
            $this->add([
                'name' => 'external_reference',
                'type' => 'text',
                'options' => [
                    'label' => 'Reference'
                ],
                'class' => 'form-control'
            ]);
        }

        public function addRemarks() {
            $this->add([
                'name' => 'remarks',
                'type' => 'textarea',
                'options' => [
                    'label' => 'Remarks'
                ],
                'class' => 'form-control'
            ]);
        }
    }