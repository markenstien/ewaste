<?php

use Services\UserService;

    class CommissionController extends Controller
    {

        public function __construct()
        {
            parent::__construct();
            $this->model = model('CommissionModel');
        }

        public function index() {
            
            if (!isEqual($this->data['whoIs']->user_type, UserService::ADMINISTRATOR)) {
                $this->data['commissions'] = $this->model->all();
            } else {
                $this->data['commissions'] = $this->model->all([
                    'commission.user_id' => $this->data['whoIs']->id
                ]);
            }

            return $this->view('commission/index', $this->data);
        }

        public function create() {

        }
    }