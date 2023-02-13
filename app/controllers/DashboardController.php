<?php
	use Services\OrderService;
	use Services\UserService;

	load(['OrderService', 'UserService'],SERVICES);
	class DashboardController extends Controller
	{

		public function __construct()
		{
			parent::__construct();

			$this->orderModel = model('OrderModel');
			$this->itemModel = model('ItemModel');
			$this->userModel = model('UserModel');
			$this->commissionModel = model('CommissionModel');

			if(!whoIs()) {
				return redirect(_route('auth:login'));
			}
		}

		public function index()
		{
			if(whoIs('user_type', UserService::ADMINISTRATOR)) {
				$data = [
					'totalSales' => $this->orderModel->_getSum(['status' => 'complete'], 'net_amount'),
					'totalOrders' => $this->orderModel->_getCount(),
					'totalCatalogs' => $this->itemModel->_getCount(),
					'totalSellers' => $this->userModel->_getCount([
						'user_type' => [
							'condition' => 'equal',
							'value' => UserService::CONSUMER
						]
					]),
					'commissions' => $this->commissionModel->all([
						'amount' => [
							'condition' => '>',
							'value' => 0
						]
					])
				];
			} else {
				$user = whoIs();

				$data = [
					'totalSales' => $this->orderModel->_getSum(['status' => 'complete', 'seller_id' => $user->id], 'net_amount'),
					'totalOrders' => $this->orderModel->_getCount(['seller_id' => $user->id]),
					'totalCatalogs' => $this->itemModel->_getCount(['user_id' => $user->id]),
					'totalSellers' => $this->userModel->_getCount([
						'user_type' => [
							'condition' => 'equal',
							'value' => UserService::CONSUMER
						]
					]),
					'commissions' => $this->commissionModel->all([
						'amount' => [
							'condition' => '>',
							'value' => 0
						],
						'user_id' => $user->id
					])
				];
			}


			return $this->view('dashboard/index',$data);
		}
	}