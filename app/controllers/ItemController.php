<?php
    load(['ItemForm'],APPROOT.DS.'form');
    load(['CategoryService', 'UserService'],SERVICES);
    load(['CategoryService'],SERVICES);

    use Form\ItemForm;
    use Services\CategoryService;
    use Services\UserService;


    class ItemController extends Controller
    {
        public function __construct()
        {
            parent::__construct();
            $this->model = model('ItemModel');
            $this->stockModel = model('StockModel');
            $this->data['item_form'] = new ItemForm();
        }

        public function index() {
            if (isEqual($this->data['whoIs']->user_type, UserService::CONSUMER)) {
                $this->data['items'] = $this->model->all([
                    'user_id' => $this->data['whoIs']->id
                ]);
            } else {
                $this->data['items'] = $this->model->all();
            }
            return $this->view('item/index',$this->data);
        }

        public function verifiedByYou() {

            $this->data['items'] = $this->model->all([
                'is_partner_verified' => $this->data['whoIs']->id
            ]);

            return $this->view('item/index', $this->data);
        }

        public function verify($id) {
            $this->model->verify(whoIs('id'), $id);
            Flash::set("You verified this product");
            return request()->return();
        }

        public function create(){
            $request = request()->inputs();
            if (isSubmitted()) {
                $res = $this->model->createOrUpdate($request);

                if($res) {
                    Flash::set($this->model->getMessageString());
                    return redirect(_route('item:show',$res));
                }
            }

            $this->data['item_form']->add([
                'name' => 'user_id',
                'type' => 'hidden',
                'value' => whoIs('id')
            ]);

            $this->data['item_form']->init([
                'action' => _route('item:create')
            ]);

            $this->view('item/create',$this->data);
        }

        public function show($id) {
            $this->data['item'] = $this->model->get($id);

            $this->data['images'] = $this->model->getImages($id);
            $this->data['attachmentForm'] = $this->attachmentForm($id);
            $this->data['stocks'] = $this->stockModel->getProductLogs($id,[
                'limit' => 5,
                'order_by' => 'id desc'
            ]);

            $this->data['attachmentForm']->setValue('redirect_to', _route('item:show', $id));

            return $this->view('item/show', $this->data);
        }

        public function edit($id) 
        {
            $request = request()->inputs();

            if (isSubmitted()) {
                $res = $this->model->createOrUpdate($request, $request['id']);
                if(!$res) {
                    Flash::set($this->model->getErrorString(),'danger');
                    return redirect(_route('item:edit', $id));
                } else {
                    Flash::set($this->model->getMessageString());
                    return redirect(_route('item:show', $id));
                }
            }    

            $item = $this->model->get($id);
            $itemForm = $this->data['item_form'];

            $itemForm->init([
                'action' => _route('item:edit', $id)
            ]);

            $itemForm->setValueObject($item);
            $itemForm->addId($id);

            if(!$item->user_id) {
                $itemForm->add([
                    'name' => 'user_id',
                    'value' => whoIs('id'),
                    'type' => 'hidden'
                ]);
            }
            $this->data['item'] = $item;
            $this->data['item_form'] = $itemForm;

            return $this->view('item/edit', $this->data);
        }

        private function attachmentForm($globalId) {
            $_attachmentForm = $this->_attachmentForm;
            $_attachmentForm->setValue('global_id', $globalId);
            $_attachmentForm->setValue('global_key', CategoryService::ITEM);
            
            return $_attachmentForm;
        }

        public function catalog() {
            if (isEqual($this->data['whoIs']->user_type, UserService::CONSUMER)) {
                $this->data['items'] = $this->model->all([
                    'item.user_id' => [
                        'condition' => 'not equal',
                        'value' => $this->data['whoIs']->id
                    ]
                ], 'id desc, item.name desc');
            } else {
                $this->data['items'] = $this->model->all();
            }

            
            if ($this->data['items']) {
                $this->data['items'] = $this->model->appendImages($this->data['items'],'URL_ONLY');
            }
            return $this->view('item/catalog', $this->data);
        }

        public function catalogShow($id) {
            $item = $this->model->get($id);
            $item->images = $this->model->getImages($id);

            $this->data['item'] = $item;
            return $this->view('item/catalog_show', $this->data);
        }
    }