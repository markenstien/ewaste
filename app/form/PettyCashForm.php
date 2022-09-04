<?php 
    namespace Form;
    use Core\Form;
    use Services\CategoryService;
    use Services\StockService;
    use Services\UserService;

    load(['UserService', 'StockService', 'CategoryService'], SERVICES);
    load(['Form'], CORE);
    
    class PettyCashForm extends Form{

        public function __construct()
        {
            parent::__construct();
            $this->name = 'petty_cash_form';

            $this->addUserId();
            $this->addAmount();
            $this->addEntryType();
            $this->addCategory();
            $this->addRemarks();
            $this->addDate();

            $this->customSubmit('Save');
        }


        public function addUserId() {

            $userModel = model('UserModel');
            $users = $userModel->all([
                'user_type' => [
                    'condition' => 'in',
                    'value' => [UserService::STAFF, UserService::SUPERVISOR]
                ]
            ]);
            $users = arr_layout_keypair($users, ['id', 'firstname@lastname']);

            $this->add([
                'name' => 'user_id',
                'type' => 'select',
                'required' => true,
                'options' => [
                    'label' => 'Users',
                    'option_values' => $users
                ],
                'class' => 'form-control'
            ]);
        }

        public function addAmount() {
            $this->add([
                'name' => 'amount',
                'type' => 'text',
                'required' => true,
                'options' => [
                    'label' => 'Amount',
                ],
                'class' => 'form-control'
            ]);
        }

        public function addEntryType() {
            $this->add([
                'name' => 'entry_type',
                'type' => 'select',
                'required' => true,
                'options' => [
                    'label' => 'Entry Type',
                    'option_values' => [
                        StockService::ENTRY_DEDUCT => 'RELEASE',
                        StockService::ENTRY_ADD => 'RETURN'
                    ]
                ],
                'class' => 'form-control'
            ]);
        }

        public function addCategory() {

            $categoryModel = model('CategoryModel');
            $categories = $categoryModel->all([
                'category' => CategoryService::PETTY,
                'active' => true
            ], 'name desc');
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

        public function addRemarks() {
            $this->add([
                'name' => 'remarks',
                'type' => 'textarea',
                'required' => true,
                'options' => [
                    'label' => 'Description',
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
                    'label' => 'Date',
                ],
                'class' => 'form-control'
            ]);
        }
    }