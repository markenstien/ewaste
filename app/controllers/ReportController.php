<?php

	use Classes\Report\SalesReport;
	use Services\StockService;

	load(['SalesReport'],CLASSES.DS.'Report');
	load(['StockService'],SERVICES);

	class ReportController extends Controller
	{

		public function __construct()
		{
			parent::__construct();
			$this->orderItemModel = model('OrderItemModel');
			$this->orderModel = model('OrderModel');
			$this->userModel = model('UserModel');
			$this->stockModel = model('StockModel');
		}

		public function salesReport() {
			$request = request()->inputs();
			$user = null;
			$this->data['page_title'] = 'Sales Report';
			if (isset($request['submit'])) {	
				$fetchReport = [
					'created_at' => [
						'condition' => 'between',
						'value' => [
							$request['start_date'],
							$request['end_date'],
						]
					]
				];

				if(!empty($request['user_id'])) {
					$fetchReport['staff_id'] = $request['user_id'];
					$user = $this->userModel->get($request['user_id']);
				}

				$orders = $this->orderModel->all($fetchReport);

				$orderIds = [];
				if(!empty($orders)) {
					foreach($orders as $key => $order) {
						array_push($orderIds, $order->id);
					}
				}


				$summaryParam = [
					'where' => [
						'order_id' => [
							'condition' => 'in',
							'value'  => $orderIds
						]
					]
				];


				$salesReport = new SalesReport();
				$saleItems = $this->orderItemModel->getItemsByParam($summaryParam);
				$highestSellingInQuantity = $this->orderItemModel->getLowestOrHighest($summaryParam, OrderItemModel::CATEGORY_QUANTITY,'desc'
				);
				$lowestSellingInQuantity = $this->orderItemModel->getLowestOrHighest(
					[
					'where' => [
						'order_id' => [
							'condition' => 'in',
							'value'  => $orderIds
						]
					]
				], OrderItemModel::CATEGORY_QUANTITY,'asc'
				);
				$highestSellingInAmount = $this->orderItemModel->getLowestOrHighest(
					$summaryParam, OrderItemModel::CATEGORY_AMOUNT,'desc'
				);
				$lowestSellingInAmount = $this->orderItemModel->getLowestOrHighest(
					$summaryParam, OrderItemModel::CATEGORY_AMOUNT,'asc'
				);

				$salesReport->setItems($saleItems);
				$salesSummary = $salesReport->getSummary();
				$this->data['isSummarized'] = true;
				$this->data['page_title'] = 'Sales Report';
				$this->data['reportData'] = [
					'saleItems' => $saleItems,
					'highestSellingInQuantity' => $highestSellingInQuantity,
					'lowestSellingInQuantity' => $lowestSellingInQuantity,
					'highestSellingInAmount' => $highestSellingInAmount,
					'lowestSellingInAmount' => $lowestSellingInAmount,
					'salesSummary' => $salesSummary,
					'today' => now(),
					'user'  => whoIs(['firstname','lastname'])
				];
			}

			$this->data['request'] = $request;
			$this->data['user'] = $user;

			return $this->view('report/sales_report', $this->data);

		}

		public function stocksReport() {
			$request = request()->inputs();

			if (isset($request['submit'])) {
				$stockService = new StockService();
				$highestStockByMaxQuantity = $this->stockModel->getHighestStock([
					'type' => $stockService::HIGHEST_BY_MAX_QUANTITY,
					'where' => [
						'date' => [
							'condition' => 'between',
							'value' => [$request['start_date'], $request['end_date']]
						]
					],
					'limit' => 6
				]);

				$lowestStockByMaxQuantity = $this->stockModel->getHighestStock([
					'type' => $stockService::LOWEST_BY_MAX_QUANTITY,
					'where' => [
						'date' => [
							'condition' => 'between',
							'value' => [$request['start_date'], $request['end_date']]
						]
					],
					'limit' => 6
				]);

				$highestStockByQuantity = $this->stockModel->getHighestStock([
					'type' => $stockService::HIGHEST_QUANTITY,
					'where' => [
						'date' => [
							'condition' => 'between',
							'value' => [$request['start_date'], $request['end_date']]
						]
					],
					'limit' => 6
				]);
				
				$lowestStockByQuantity = $this->stockModel->getHighestStock([
					'type' => $stockService::LOWEST_QUANTITY,
					'where' => [
						'date' => [
							'condition' => 'between',
							'value' => [$request['start_date'], $request['end_date']]
						]
					],
					'limit' => 6
				]);
				
				$stocks = $this->stockModel->getStocks([
					'where' => [
						'date' => [
							'condition' => 'between',
							'value' => [$request['start_date'], $request['end_date']]
						]
					],
				]);
				$this->data['reportData'] = [
					'highestStockByMaxQuantity' => $highestStockByMaxQuantity,
					'highestStockByQuantity'    => $highestStockByQuantity,
					'lowestStockByMaxQuantity' => $lowestStockByMaxQuantity,
					'lowestStockByQuantity'    => $lowestStockByQuantity,
					'stocks' => $stocks,
					'displayname' => whoIs(['firstname','lastname']),
					'username' => whoIs('username'),
					'dateNow' => now()
				];

			}

			$this->data['page_title'] = 'Sales Report';
			$this->data['request'] = $request;

			return $this->view('report/stock_report', $this->data);
		}

		public function pettyCashReport() {
			$this->data['page_title'] = 'Petty Cash Report';
			return $this->view('report/petty_cash', $this->data);
		}

		public function ledgerReport() {
			$this->data['page_title'] = 'Petty Cash Report';
			return $this->view('report/ledger_report', $this->data);
		}
		

		public function index()
		{	
			return $this->view('report/index');
		}
	}