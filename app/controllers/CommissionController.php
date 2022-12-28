<?php

use Services\UserService;

    class CommissionController extends Controller
    {

        public function __construct()
        {
            parent::__construct();
            $this->model = model('CommissionModel');
            $this->commissionReleaseModel = model('CommissionReleaseModel');
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

        public function availableCommissions() {
            $this->data['commissions'] = $this->model->getAvailableCommissions();
            return $this->view('commission/commissions_available', $this->data);
        }

        /**
         * release request
         */
        public function release($userId = null){
            $req = request()->get();
            if(isset($userId)) {
                $isOkay = $this->commissionReleaseModel->release($userId);
                if($isOkay) {
                    Flash::set($this->commissionReleaseModel->getMessageString());
                    return request()->return();
                } else {
                    Flash::set($this->commissionReleaseModel->getErrorString(), 'danger');
                    return request()->return();
                }
            } else {
                $isOkay = $this->commissionReleaseModel->release();
                if($isOkay) {
                    Flash::set($this->commissionReleaseModel->getMessageString());
                    return request()->return();
                } else {
                    Flash::set($this->commissionReleaseModel->getErrorString(), 'danger');
                    return request()->return();
                }
            }
        }

        public function requests() {
            $req = request()->get();

            if(isset($req['action'])) {
                csrfValidate();
                switch($req['action']) {
                    case 'approve':
                        $response = $this->commissionReleaseModel->deployRelease($req['id']);
                        $message = "Commission Request has been approved";
                    break;
                    case 'cancel';
                        $response = $this->commissionReleaseModel->cancelRelease($req['id']);
                        $message = "Commission Request has been declined";
                    break;
                }

                if ($response) {
                    Flash::set($message);
                }else {
                    Flash::set($this->commissionReleaseModel->getErrorString(), 'danger');
                }
            }

            $page = $req['page'] ?? 'pending'; 

            switch($page){
                case 'pending':
                    $where = [
                        'request.status' => 'pending'
                    ];
                break;

                case 'approved':
                    $where = [
                        'request.status' => 'approved'
                    ];
                break;

                case 'declined':
                    $where = [
                        'request.status' => 'declined'
                    ];
                break;
            }

            $this->data['commission_requests'] = $this->commissionReleaseModel->getAll([
                'order' => "FIELD(request.status, 'pending','approved','declined')",
                'where' => $where
            ]);

            $this->data['csrf'] = csrfGet();
            $this->data['page'] = $page;
            return $this->view('commission/requests', $this->data);
        }
        public function create() {

        }
    }