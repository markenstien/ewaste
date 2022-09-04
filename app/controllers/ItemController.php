<?php
    load(['ItemForm'],APPROOT.DS.'form');
    load(['CategoryService'],SERVICES);

    use Form\ItemForm;
    use Services\CategoryService;

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
            $this->data['items'] = $this->model->all();
            return $this->view('item/index',$this->data);
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
    }