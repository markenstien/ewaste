<?php
	use Services\OrderService;
	load(['OrderService'],SERVICES);
	class DashboardController extends Controller
	{

		public function index()
		{
			return $this->view('dashboard/index_tmp',$this->data);
		}
	}