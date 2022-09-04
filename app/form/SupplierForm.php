<?php
    namespace Form;

    load(['Form'], CORE);
    use Core\Form;

    class SupplierForm extends Form
    {
        public function __construct($name = '')
        {
            parent::__construct();
            $this->name = empty($name) ? 'supplier_form' : $name;

            $this->addName();
            $this->addProduct();
            $this->addWebsite();
            $this->addRemarks();
            $this->addStatus();
            $this->addStartDate();
            $this->addContactPersonName();
            $this->addContactPersonNumber();

            $this->customSubmit('Save Supplier');
        }

        public function addName()
        {
            $this->add([
                'name' => 'name',
                'type' => 'text',
                'options' => [
                    'label' => 'Supplier Name',
                    'placeholder' => 'Name of supplier',
                ],
                'class' => 'form-control',
                'required' => true
            ]);
        }
        
        public function addProduct()
        {
            $this->add([
                'name' => 'product',
                'type' => 'text',
                'options' => [
                    'label' => 'Supplier Product',
                    'placeholder' => 'Product of  your supplier'
                ],
                'required' => true,
                'class' => 'form-control'
            ]);
        }

        public function addWebsite()
        {
            $this->add([
                'name' => 'website',
                'type' => 'text',
                'options' => [
                    'label' => 'Website Link',
                    'placeholder' => 'website link',
                ],
                'class' => 'form-control'
            ]);
        }

        public function addRemarks()
        {
            $this->add([
                'name' => 'remarks',
                'type' => 'textarea',
                'options' => [
                    'label' => 'Remarks',
                    'placeholder' => 'Tell more about your supplier',
                    'rows' => 3
                ],
                'class' => 'form-control'
            ]);
        }

        public function addStatus()
        {
            $this->add([
                'name' => 'status',
                'type' => 'select',
                'options' => [
                    'label' => 'Status',
                    'option_values' => [
                        'terminate','active'
                    ]
                ],
                'value' => 'active',
                'required' => true,
                'class' => 'form-control'
            ]);
        }

        public function addStartDate()
        {
            $this->add([
                'name' => 'date_start',
                'type' => 'date',
                'options' => [
                    'label' => 'Start Date'
                ],
                'class' => 'form-control'
            ]);
        }


        public function addContactPersonName()
        {
            $this->add([
                'name' => 'contact_person_name',
                'type' => 'text',
                'options' => [
                    'label' => 'Contact Person Name'
                ],
                'required' => true,
                'class' => 'form-control'
            ]);
        }

        public function addContactPersonNumber()
        {
            $this->add([
                'name' => 'contact_person_number',
                'type' => 'text',
                'options' => [
                    'label' => 'Contact Person Number'
                ],
                'required' => true,
                'class' => 'form-control'
            ]);
        }

    }