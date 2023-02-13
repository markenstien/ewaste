<?php

    use Form\CategoryForm;
    load(['CategoryForm'],APPROOT.DS.'form');

    class CategoryController extends Controller
    {
        public function __construct()
        {
            $this->model = model('CategoryModel');
            $this->categoryForm = new CategoryForm();
        }

        public function index() {
            $this->data['categories'] = $this->model->all();
            return $this->view('category/index', $this->data);
        }

        public function create() {
            $req = request()->inputs();
            if(isSubmitted()) {
                $post = request()->posts();
                $req = $this->model->createOrUpdate($post);

                if($req) {
                    Flash::set($this->model->getMessageString());
                }else{
                    Flash::set($this->model->getErrorString(),'danger');
                }

                return redirect(_route('category:index'));
            }
            $this->categoryForm->init([
                'method' => 'post',
                'url' => _route('category:create')
            ]);

            $this->data['category_form'] = $this->categoryForm;
            return $this->view('category/create', $this->data);
        }

        public function edit($id) {
            $req = request()->inputs();
            if(isSubmitted()) {
                $post = request()->posts();
                $req = $this->model->createOrUpdate($post, $id);

                if($req) {
                    Flash::set($this->model->getMessageString());
                }else{
                    Flash::set($this->model->getErrorString(),'danger');
                }

                return redirect(_route('category:edit', $id));
            }
            $this->categoryForm->init([
                'method' => 'post',
                'url' => _route('category:edit', $id)
            ]);

            $category = $this->model->get($id);

            $this->categoryForm->setValueObject($category);
            $this->data['category_form'] = $this->categoryForm;
            $this->data['category'] = $category;

            return $this->view('category/edit', $this->data);
        }

        public function deactivateOrActivate($id) {
            $this->model->deactivateOrActivate($id);
            Flash::set($this->model->getMessageString());
            return redirect(_route('category:index'));
        }
    }