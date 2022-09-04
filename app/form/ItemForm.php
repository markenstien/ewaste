<?php

    namespace Form;

    load(['Form'],CORE);
    load(['CategoryService'], SERVICES);
    use Core\Form;
    use Services\CategoryService;

    class ItemForm extends Form{

        public function __construct($name = '')
        {
            parent::__construct();
            $this->name = empty($name) ? 'Item Form' : $name;
            
            $this->addName();
            $this->addSku();
            $this->addBarcode();
            $this->addCostPrice();
            $this->addSellPrice();
            $this->addMinStock();
            $this->addMaxStock();
            $this->addCategory();
            $this->addVariant();
            $this->addRemarks();

            $this->customSubmit('Save Item');
        }

        public function addName() {
            $this->add([
                'name' => 'name',
                'type' => 'text',
                'required' => true,
                'options' => [
                    'label' => 'Item Name'
                ],
                'class' => 'form-control'
            ]);
        }

        public function addSku() {
            $this->add([
                'name' => 'sku',
                'type' => 'text',
                'required' => true,
                'options' => [
                    'label' => 'SKU'
                ],
                'class' => 'form-control'
            ]);
        }

        public function addBarcode() {
            $this->add([
                'name' => 'barcode',
                'type' => 'text',
                'options' => [
                    'label' => 'Barcode'
                ],
                'class' => 'form-control'
            ]);
        }

        public function addCostPrice() {
            $this->add([
                'name' => 'cost_price',
                'type' => 'text',
                'required' => true,
                'options' => [
                    'label' => 'Cost Price'
                ],
                'class' => 'form-control'
            ]);
        }

        public function addSellPrice() {
            $this->add([
                'name' => 'sell_price',
                'type' => 'text',
                'required' => true,
                'options' => [
                    'label' => 'Sell Price'
                ],
                'class' => 'form-control'
            ]);
        }

        public function addMinStock() {
            $this->add([
                'name' => 'min_stock',
                'type' => 'number',
                'required' => true,
                'options' => [
                    'label' => 'Minimum Stocks'
                ],
                'class' => 'form-control'
            ]);
        }

        public function addMaxStock() {
            $this->add([
                'name' => 'max_stock',
                'type' => 'number',
                'required' => true,
                'options' => [
                    'label' => 'Maximum Stocks'
                ],
                'class' => 'form-control'
            ]);
        }


        public function addCategory() {
            $categoryModel = model('CategoryModel');
            $categories = $categoryModel->all(['category'=>'item'],'*','name asc');
            $categories = arr_layout_keypair($categories,['id','name']);
            $this->add([
                'name' => 'category_id',
                'type' => 'select',
                'required' => true,
                'options' => [
                    'label' => 'Category',
                    'option_values' => $categories
                ],
                'class' => 'form-control'
            ]);
        }


        public function addVariant() {
            $this->add([
                'name' => 'variant',
                'type' => 'text',
                'options' => [
                    'label' => 'Variant'
                ],
                'class' => 'form-control'
            ]);
        }

        public function addRemarks() {
            $this->add([
                'name' => 'remarks',
                'type' => 'textarea',
                'options' => [
                    'label' => 'Remarks',
                    'rows' => 3
                ],
                'class' => 'form-control'
            ]);
        }
    }