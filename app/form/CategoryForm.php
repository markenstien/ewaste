<?php
    namespace Form;
    
    use Core\Form;
    use Services\CategoryService;

    load(['Form'],CORE);
    load(['CategoryService'],SERVICES);
    
    class CategoryForm extends Form
    {
        public function __construct()
        {
            parent::__construct();

            $this->name = 'category_form';
            $this->addName();
            $this->addCategory();

            $this->customSubmit('Create New Category');
        }

        public function addName() {
            $this->add([
                'name' => 'name',
                'type' => 'text',
                'required' => true,
                'options' => [
                    'label' => 'Name'
                ],
                'class' => 'form-control'
            ]);
        }

        public function addCategory() {
            $this->add([
                'name' => 'category',
                'type' => 'select',
                'required' => true,
                'options' => [
                    'label' => 'Category For',
                    'option_values' => [
                        CategoryService::PETTY,
                        CategoryService::COMMON_TRANSACTIONS,
                        CategoryService::ITEM
                    ]
                ],
                'class' => 'form-control'
            ]);
        }
    }