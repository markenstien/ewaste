<?php
	
	$routes = [];

	$controller = '/MailerController';
	$routes['mailer'] = [
		'index' => $controller.'/index',
		'edit' => $controller.'/edit',
		'create' => $controller.'/create',
		'delete' => $controller.'/destroy',
		'send'   => $controller.'/send'
	];

	$controller = '/UserController';
	$routes['user'] = [
		'index' => $controller.'/index',
		'edit' => $controller.'/edit',
		'create' => $controller.'/create',
		'delete' => $controller.'/destroy',
		'show'   => $controller.'/show',
		'sendCredential' => $controller.'/sendCredential',
		'toPartner' => $controller.'/toPartner',
		'removePartner' => $controller.'/removePartner',
		'verifier-applications' => $controller .'/verifierApplication',
		'verify-registration' => $controller .'/verifyRegistration',
		'resend-verify-registration' => $controller.'/resendVerifyRegistration'
	];

	
	$controller = '/StockController';
	$routes['stock'] = [
		'index' => $controller.'/index',
		'edit' => $controller.'/edit',
		'create' => $controller.'/addStock',
		'delete' => $controller.'/destroy',
		'show'   => $controller.'/show',
		'log'   => $controller.'/log',
	];

	$controller = '/AuthController';
	$routes['auth'] = [
		'login' => $controller.'/login',
		'register' => $controller.'/register',
		'logout' => $controller.'/logout',
	];

	$controller = '/AttachmentController';
	$routes['attachment'] = [
		'index' => $controller.'/index',
		'edit' => $controller.'/edit',
		'create' => $controller.'/create',
		'delete' => $controller.'/destroy',
		'download' => $controller.'/download',
		'show'   => $controller.'/show'
	];


	$controller = '/SupplierController';
	$routes['supplier'] = [
		'index' => $controller.'/index',
		'edit' => $controller.'/edit',
		'create' => $controller.'/create',
		'delete' => $controller.'/destroy',
		'download' => $controller.'/download',
		'show'   => $controller.'/show'
	];

	$controller = '/ItemController';
	$routes['item'] = [
		'index' => $controller.'/index',
		'edit' => $controller.'/edit',
		'create' => $controller.'/create',
		'delete' => $controller.'/destroy',
		'download' => $controller.'/download',
		'show'   => $controller.'/show',
		'catalog'   => $controller.'/catalog',
		'catalog-detail'   => $controller.'/catalogShow',
		'verify' => $controller .'/verify'
	];

	$controller = '/TransactionController';
	$routes['transaction'] = [
		'index' => $controller.'/index',
		'purchase' => $controller.'/purchase',
		'purchaseAddItem' => $controller.'/purchaseAddItem',
		'purchaseReset' => $controller.'/purchaseResetSession',
		'create' => $controller.'/create',
		'delete' => $controller.'/destroy',
		'download' => $controller.'/download',
		'show'   => $controller.'/show',
		'savePayment'  => $controller.'/savePayment'
	];

	$controller = '/ReceiptController';
	$routes['receipt'] = [
		'index' => $controller.'/index',
		'order' => $controller.'/orderReceipt',
		'create' => $controller.'/create',
		'delete' => $controller.'/destroy',
		'show'   => $controller.'/show',
	];

	$controller = '/OrderController';
	$routes['order'] = [
		'index' => $controller.'/index',
		'order' => $controller.'/orderReceipt',
		'create' => $controller.'/create',
		'delete' => $controller.'/destroy',
		'show'   => $controller.'/show',
		'void'   => $controller.'/voidOrder',
		'buy-now'   => $controller.'/buyNow',
		'delivered' => $controller. '/delivered'
	];

	$controller = '/PaymentController';
	$routes['payment'] = [
		'index' => $controller.'/index',
		'order' => $controller.'/orderReceipt',
		'create' => $controller.'/create',
		'delete' => $controller.'/destroy',
		'show'   => $controller.'/show',
		'bank-payment' => $controller .'/bankPayment'
	];


	$controller = '/CommissionController';
	$routes['commission'] = [
		'index' => $controller.'/index',
		'order' => $controller.'/orderReceipt',
		'create' => $controller.'/create',
		'delete' => $controller.'/destroy',
		'show'   => $controller.'/show',
		'releases' => $controller. '/releases',
		'available-commissions' => $controller. '/availableCommissions',
		'release' => $controller .'/release',
		'request' => $controller .'/requests'
	];
	

	$controller = '/SupplyOrderController';
	$routes['supply-order'] = [
		'index' => $controller.'/index',
		'order' => $controller.'/orderReceipt',
		'create' => $controller.'/create',
		'delete' => $controller.'/destroy',
		'show'   => $controller.'/show',
		'approve-and-update-stock' => $controller.'/approveAndUpdateStock'
	];
	
	$controller = '/SupplyOrderItemController';
	$routes['supply-order-item'] = [
		'add-item' => $controller.'/addItem',
		'edit-item' => $controller.'/editItem',
		'order' => $controller.'/orderReceipt',
		'create' => $controller.'/create',
		'delete' => $controller.'/destroy',
		'show'   => $controller.'/show'
	];

	$controller = '/PettyCashController';
	$routes['petty-cash'] = [
		'create' => $controller.'/create',
		'index' => $controller.'/index',
		'edit' => $controller.'/edit',
		'order' => $controller.'/orderReceipt',
		'delete' => $controller.'/destroy',
		'show'   => $controller.'/show',
		'logs' => $controller.'/logs'
	];

	$controller = '/CategoryController';
	$routes['category'] = [
		'create' => $controller.'/create',
		'index' => $controller.'/index',
		'edit' => $controller.'/edit',
		'order' => $controller.'/orderReceipt',
		'delete' => $controller.'/destroy',
		'show'   => $controller.'/show',
		'logs' => $controller.'/logs',
		'deactivate' => $controller.'/deactivateOrActivate'
	];

	$controller = '/DashboardController';
	$routes['dashboard'] = [
		'index' => $controller.'/index',
		'edit' => $controller.'/edit',
		'create' => $controller.'/create',
		'create' => $controller.'/create',
		'delete' => $controller.'/destroy',
		'show'   => $controller.'/show',
		'update' => $controller.'/update',
		'phyical-examination' => $controller. '/phyicalExamination'
	];

	$controller = '/ReportController';
	$routes['report'] = [
		'index' => $controller.'/index',
		'sales' => $controller.'/salesReport',
		'stocks' => $controller.'/stocksReport',
		'create' => $controller.'/create',
		'delete' => $controller.'/destroy',
		'download' => $controller.'/download',
		'show'   => $controller.'/show',
		'live'   => $controller.'/live',
		'new'    => $controller.'/new',
		'serve'  => $controller.'/serve',
		'skip'   => $controller.'/skip',
		'complete' => $controller.'/complete',
		'reset'   => $controller.'/reset'
	];

	
	$controller = '/QueueController';
	$routes['queue'] = [
		'index' => $controller.'/index',
		'edit' => $controller.'/edit',
		'create' => $controller.'/create',
		'delete' => $controller.'/destroy',
		'download' => $controller.'/download',
		'show'   => $controller.'/show',
		'live'   => $controller.'/live',
		'new'    => $controller.'/new',
		'serve'  => $controller.'/serve',
		'skip'   => $controller.'/skip',
		'complete' => $controller.'/complete',
		'reset'   => $controller.'/reset'
	];

	$controller = '/FormBuilderController';
	$routes['form'] = [
		'index' => $controller.'/index',
		'edit' => $controller.'/edit',
		'create' => $controller.'/create',
		'delete' => $controller.'/destroy',
		'show'   => $controller.'/show',
		'add-item' => $controller.'/addItem',
		'edit-item' => $controller. '/editItem',
		'delete-item' => $controller. '/deleteItem',
		'respond'   => '/FormController'.'/respond'
	];

	return $routes;
?>