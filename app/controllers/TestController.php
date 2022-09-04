<?php 

	class TestController extends Controller

	{

		public function index()
		{
			return $this->view('test/index');
		}
	}