<?php
    namespace Form;
    use Core\Form;
    load(['Form'], CORE);

    class SupplyOrderForm extends Form
    {
        public function __construct() {
            parent::__construct();
            $this->addTitle();
            $this->addSupplier();
            $this->addDate();
            $this->addBudget();
            $this->addDescription();
            $this->customSubmit('Save');
        }

        public function addTitle() {
            $this->add([
                'name' => 'title',
                'type' => 'text',
                'required' => true,
                'options' => [
                    'label' => 'Title'
                ],
                'class' => 'form-control'
            ]);
        }

        public function addSupplier() {

            $supplierModel = model('SupplierModel');
            $suppliers = $supplierModel->all(['status' => 'active'], 'name desc');
            $suppliers = arr_layout_keypair($suppliers,['id','name']);
            
            $this->add([
                'name' => 'supplier_id',
                'type' => 'select',
                'required' => true,
                'options' => [
                    'label' => 'Supplier',
                    'option_values' => $suppliers
                ],
                'class' => 'form-control'
            ]);
        }

        public function addDate() {
            $this->add([
                'name' => 'date',
                'type' => 'date',
                'required' => true,
                'options' => [
                    'label' => 'Date Of Order'
                ],
                'class' => 'form-control'
            ]);
        }

        public function addBudget() {
            $this->add([
                'name' => 'budget',
                'type' => 'text',
                'required' => true,
                'options' => [
                    'label' => 'Budget'
                ],
                'class' => 'form-control'
            ]);
        }

        public function addDescription() {
            $this->add([
                'name' => 'description',
                'type' => 'textarea',
                'options' => [
                    'label' => 'Description'
                ],
                'class' => 'form-control'
            ]);
        }
    }