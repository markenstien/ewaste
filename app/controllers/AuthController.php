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
			if(whoIs()) {
				return redirect(_route('dashboard:index'));
			}
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
			if(whoIs()) {
				return redirect(_route('dashboard:index'));
			}
			if(isSubmitted())
			{
				$post = request()->posts();

				$res = $this->user->authenticate($post['email'] , $post['password']);

				if(!$res) {
					Flash::set($this->user->getErrorString(), 'danger');
					return request()->return();
				}else
				{
					Flash::set( "Welcome Back !" . auth('firstname'));
				}

				if(!whoIs('is_term_accepted')) {
					Flash::set("Thanks for registerin in our platform, before enjoying our services , accept our terms and condition");
					return redirect(_route('auth:terms'));
				}

				if(!isEqual(auth('user_type'), UserService::ADMINISTRATOR)) {
					return redirect(_route('item:catalog'));
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

		public function terms() {
			if(!whoIs()) {
				return redirect(_route('landing:home'));
			} else {
				$req = request()->inputs();
				if(isset($req['accept'])) {
					$this->user->acceptTerms(whoIs('id'));
					Flash::set("Terms and Agreement Accepted");
					return redirect(_route('item:catalog'));
				}
				return $this->view('auth/terms');
			}
		}
	}