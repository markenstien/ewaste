<?php 
	
	load(['UserForm'] , APPROOT.DS.'form');
	load(['UserService'] , SERVICES);
	use Form\UserForm;
	use Services\UserService;

	class AuthController extends Controller
	{	

		public function __construct()
		{
			$this->user = model('UserModel');
			$this->_form = new UserForm();
		}

		public function index()
		{
			if(whoIs()) {
				return redirect(_route('dashboard:index'));
			}
			return $this->login();
		}

		public function register() {

			if(isSubmitted()) {
				$post = request()->posts();
				$isOkay = $this->user->register($post);

				if($isOkay) {
					Flash::set($this->user->getMessageString());
					return redirect(_route('auth:login'));
				} else {
					Flash::set($this->user->getErrorString(), 'danger');
					return request()->return();
				}
			}

			$this->_form->init([
				'url' => _route('auth:register')
			]);
			$this->_form->remove('user_type');
			$this->_form->add([
				'name' => 'user_type',
				'type' => 'hidden',
				'value' => UserService::CONSUMER
			]);
			$this->data['form'] = $this->_form;
			return $this->view('auth/register', $this->data);
		}
		public function login()
		{
			if(isSubmitted())
			{
				$post = request()->posts();

				$res = $this->user->authenticate($post['email'] , $post['password']);

				if(!$res) {
					Flash::set( $this->user->getErrorString() , 'danger');
					return request()->return();
				}else
				{
					Flash::set( "Welcome Back !" . auth('first_name'));
				}

				return redirect('DashboardController');
			}

			$form = $this->_form;

			$form->init([
				'url' => _route('auth:login')
			]);

			$form->customSubmit('Login' , 'submit' , ['class' => 'btn btn-primary btn-sm']);

			$data = [
				'title' => 'Login Page',
				'form'  => $form
			];

			return $this->view('auth/login' , $data);
		}

		public function logout()
		{
			session_destroy();
			Flash::set("Successfully logged-out");
			return redirect( _route('auth:login') );
		}
	}