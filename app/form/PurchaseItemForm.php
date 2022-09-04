<?php

    namespace Form;
    use Core\Form;
    load(['Form'], CORE);

    class PurchaseItemForm extends Form {

        public function __construct($name = '')
        {
            parent::__construct();
            $this->name = empty($name) ? 'Item Purchase Form' : $name;
            $this->addItem();
            $this->addSoldPrice();
            $this->addQuantity();
            $this->addDiscountPrice();
            $this->addRemarks();

            $this->addAvailableStock();
        }

        public function addItem($value = null) {
            $itemModel = model('ItemModel');
            $items = $itemModel->all(null, 'name asc');
            $html = "<select required id='item' class='form-control' name='item_id'>";
                $html .= "<option value=''>--Select Item</option>";
                foreach($items as $key => $row) {
                    $isSelected = $row->id == $value ? 'selected' : '';
                    $html .= "<option value='{$row->id}' 
                        data-price='{$row->sell_price}'
                        data-stock='{$row->total_stock}' {$isSelected}>{$row->name}</option>";
                }

            $html .= "</select>";
            $this->addCustom('item_id', 'Item', $html);
        }

        public function addQuantity() {
            $this->add([
                'type' => 'number',
                'name' => 'quantity',
                'required' => true,
                'options' => [
                    'label' => 'Quantity'
                ],
                'attributes' => [
                    'id' => 'quantity'
                ],
                'class' => 'form-control'
            ]);
        }

        public function addDiscountPrice() {
            $this->add([
                'type' => 'text',
                'name' => 'discount_price',
                'options' => [
                    'label' => 'Discount Price'
                ],
                'class' => 'form-control'
            ]);
        }

        public function addRemarks() {
            $this->add([
                'type' => 'textarea',
                'name' => 'remarks',
                'options' => [
                    'label' => 'Remarks'
                ],
                'class' => 'form-control'
            ]);
        }
        
        public function addSoldPrice() {
            $this->add([
                'type' => 'text',
                'name' => 'price',
                'options' => [
                    'label' => 'Price',
                ],
                'attributes' => [
                    'id' => 'price',
                    'readonly' => true
                ],
                'class' => 'form-control'
            ]);
        }

        public function addAvailableStock() {
            $this->add([
                'type' => 'text',
                'name' => 'available_stock',
                'options' => [
                    'label' => 'Available Stock',
                ],
                'attributes' => [
                    'id' => 'available_stock',
                    'readonly' => 'true',
                ],

                'class' => 'form-control'
            ]);
        }

    }