<?php 

	class TestController extends Controller
	{

		public function index()
		{
			return $this->view('test/index');
		}

		public function sendEmail() {

			_mail([
				'chromaticsoftwares@gmail.com',
				'gonzalesmarkangeloph@gmail.com'
			], 'This is a test', 'random email test');
		}
	}