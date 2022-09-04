<?php
    namespace Form;
    use Core\Form;
    use Services\StockService;

    load(['Form'], CORE);
    load(['StockService'], SERVICES);

    class StockForm extends Form {

        public function __construct($name = '')
        {
            parent::__construct();
            $this->name = empty($name) ? 'Stock Form' : '';
            $this->init([
                'action' => _route('stock:create')    
            ]);

            $this->addQuantity();
            $this->addEntryType();
            $this->addEntryOrigin();
            $this->addDate();
            $this->addRemarks();
            $this->addItem();
            $this->addPurchaseOrder();
            $this->customSubmit('Save Stock');
        }

        public function addQuantity() {
            $this->add([
                'name' => 'quantity',
                'type' => 'number',
                'required' => true,
                'options' => [
                    'label' => 'Quantity'
                ],
                'class' => 'form-control'
            ]);
        }

        public function addRemarks() {
            $this->add([
                'name' => 'remarks',
                'type' => 'textarea',
                'options' => [
                    'label' => 'Description',
                    'rows' => 3
                ],
                'class' => 'form-control'
            ]);
        }

        public function addDate() {
            $this->add([
                'name' => 'date',
                'type' => 'date',
                'options' => [
                    'label' => 'Entry Date'
                ],
                'class' => 'form-control'
            ]);
        }

        public function addEntryType($value = null) {
            $this->add([
                'name' => 'entry_type',
                'type' => 'select',
                'options' => [
                    'label' => 'Entry Type',
                    'option_values' => [
                        'ADD','DEDUCT'
                    ]
                ],
                'required' => true,
                'value'    => $value ?? 'ADD', //for default value only,
                'class' => 'form-control'
            ]);
        }

        public function addEntryOrigin() {
            $this->add([
                'name' => 'entry_origin',
                'type' => 'select',
                'options' => [
                    'label' => 'Entry Origin',
                    'option_values' => [
                        StockService::SALES, StockService::PURCHASE_ORDER
                    ]
                ],
                'required' => true,
                'class' => 'form-control'
            ]);
        }


        public function addItem() {
            $this->add([
                'name' => 'item_id',
                'type' => 'hidden',
                'options' => [
                    'label' => 'Item Id'
                ],
                'required' => true
            ]);
        }

        public function addPurchaseOrder() {
            $this->add([
                'name' => 'purchase_order_number',
                'type' => 'text',
                'options' => [
                    'label' => 'Purchase Order (Optional)'
                ],
                'class' => 'form-control'
            ]);
        }

        public function addCreatedBy() {
            $this->add([
                'name' => 'created_by',
                'type' => 'hidden',
                'options' => [
                    'label' => 'Created By'
                ]
            ]);
        }


    }