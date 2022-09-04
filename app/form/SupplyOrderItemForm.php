<?php
    namespace Form;
    use Core\Form;

    load(['Form'],CORE);
    class SupplyOrderItemForm extends Form
    {
        public function __construct()
        {
            parent::__construct();

            $this->name = 'supply_item_form';
            $this->addSupplyOrderId();   
            $this->addItemId();
            $this->addQuantity();
            $this->addSupplierPrice();
            $this->customSubmit('Save');
        } 

        public function addSupplyOrderId() {
            $this->add([
                'name' => 'supply_order_id',
                'type' => 'hidden',
                'options' => [
                    'label' => 'Supply Order'
                ],
                'class' => 'form-control'
            ]);
        }

        public function addItemId() {
            $item = model('ItemModel');
            $items = $item->all(null, 'name asc');
            $items = arr_layout_keypair($items,['id','name@sku']);

            $this->add([
                'name' => 'product_id',
                'type' => 'select',
                'options' => [
                    'label' => 'Item',
                    'option_values' => $items
                ],
                'class' => 'form-control'
            ]);
        }

        public function addQuantity() {
            $this->add([
                'name' => 'quantity',
                'type' => 'text',
                'options' => [
                    'label' => 'Quantity'
                ],
                'class' => 'form-control'
            ]);
        }

        public function addSupplierPrice() {
            $this->add([
                'name' => 'supplier_price',
                'type' => 'text',
                'options' => [
                    'label' => 'Supplier Price'
                ],
                'class' => 'form-control'
            ]);
        }

        public function addDamagedQuantity() {
            $this->add([
                'name' => 'damaged_quantity',
                'type' => 'text',
                'options' => [
                    'label' => 'Damaged Quantity'
                ],
                'class' => 'form-control'
            ]);
        }

        public function addDamageNotes() {
            $this->add([
                'name' => 'damage_notes',
                'type' => 'textarea',
                'options' => [
                    'label' => 'Damage Notes'
                ],
                'class' => 'form-control'
            ]);
        }
    }