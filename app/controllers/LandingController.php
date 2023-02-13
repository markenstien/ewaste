<?php
    use Services\CategoryService;
    load(['CategoryService'],SERVICES);

    class LandingController extends Controller
    {      
        public function __construct()
        {
            parent::__construct();
            
            $this->categoryModel = model('CategoryModel');
            $this->orderModel = model('OrderModel');
            $this->itemModel = model('ItemModel');
        }
        
        public function index() {
            $categories = $this->categoryModel->all(['category'=> CategoryService::ITEM],'*','name asc');

            $this->data['popularItems'] = $this->orderModel->getTopSellingProduct();

            $this->data['categories'] = $categories;

            if($this->data['popularItems']) {
                $this->data['popularItems'] = $this->itemModel->appendImages($this->data['popularItems'],'URL_ONLY');
            }

            return $this->view('landing/index', $this->data);
        }

        public function contact() {
            if(isSubmitted()) {
                $post = request()->posts();

                $emailTxt = 'Name : '.$post['name'] . '<br/>';
                $emailTxt .= 'Email : '.$post['email'] . '<br/>';
                $emailTxt .= "<div style='margin-top:30px'>{$post['message']}</div>";
                $mailBody = wEmailComplete($emailTxt);
                _mail($post['email'], $post['subject'], $mailBody);

                Flash::set("Email has been sent!");
                return redirect(_route('landing:contact'));
            }
            return $this->view('landing/contact');
        }
    }