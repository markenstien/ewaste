<?php 

    class TaxController extends Controller
    {
        public function __construct()
        {
            parent::__construct();
            $this->model = model('TaxModel');
        }

        public function index() {
            $this->data['tax_logs'] = $this->model->all(null, '*', 'id desc');
            return $this->view('tax/index', $this->data);
        }
        public function create() 
        {
            if(isSubmitted()) {
                $post = request()->posts();
                $this->model->updateTax([
                    'tax_percentage' => $post['tax_percentage']
                ]);

                Flash::set("Tax Settings updated");
                return redirect(_route('tax:index'));
            }
            return $this->view('tax/create', $this->data);
        }
    }