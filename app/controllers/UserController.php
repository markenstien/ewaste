<?php 
	load(['UserForm'] , APPROOT.DS.'form');
	use Form\UserForm;
	class UserController extends Controller
	{

		public function __construct()
		{
			parent::__construct();

			$this->model = model('UserModel');
			
			$this->data['page_title'] = ' Users ';
			$this->data['user_form'] = new UserForm();
		}

		public function index()
		{
			$params = request()->inputs();

			if(!empty($params))
			{
				$this->data['users'] = $this->model->getAll([
					'where' => $params
				]);
			}else{
				$this->data['users'] = $this->model->getAll();
			}
			

			return $this->view('user/index' , $this->data);
		}

		public function create()
		{
			if(isSubmitted()) {
				$post = request()->posts();
				$user_id = $this->model->create($post , 'profile');
				if(!$user_id){
					Flash::set( $this->model->getErrorString() , 'danger');
					return request()->return();
				}

				Flash::set('User Record Created');
				if( isEqual($post['user_type'] , 'patient') )
				{
					Flash::set('Patient Record Created');
					return redirect(_route('patient-record:create' , null , ['user_id' => $user_id]));
				}

				return redirect( _route('user:show' , $user_id , ['user_id' => $user_id]) );
			}
			$this->data['user_form'] = new UserForm('userForm');

			return $this->view('user/create' , $this->data);
		}

		public function edit($id)
		{
			if(isSubmitted()) {
				$post = request()->posts();
				$post['profile'] = 'profile';
				$res = $this->model->update($post , $post['id']);

				if($res) {
					Flash::set( $this->model->getMessageString());
					return redirect( _route('user:show' , $id) );
				}else
				{
					Flash::set( $this->model->getErrorString() , 'danger');
					return request()->return();
				}
			}

			$user = $this->model->get($id);

			$this->data['id'] = $id;
			$this->data['user_form']->init([
				'url' => _route('user:edit',$id)
			]);

			$this->data['user_form']->setValueObject($user);
			$this->data['user_form']->addId($id);
			$this->data['user_form']->remove('submit');
			$this->data['user_form']->add([
				'name' => 'password',
				'type' => 'password',
				'class' => 'form-control',
				'options' => [
					'label' => 'Password'
				]
			]);

			if(!isEqual(whoIs('user_type'), 'admin'))
				$this->data['user_form']->remove('user_type');

			return $this->view('user/edit' , $this->data);
		}

		public function show($id)
		{
			$req = request()->inputs();
			$user = $this->model->get($id);

			$viewPage = $req['view_page'] ?? 'products';
			if(!$user) {
				Flash::set(" This user no longer exists " , 'warning');
				return request()->return();
			}
			$this->data['user'] = $user;
			$this->data['is_admin'] = $this->is_admin;

			$number_of_days_after_deployment = null;
			$number_of_days_remaining = null;
			
			$this->data['number_of_days_remaining'] = $number_of_days_remaining;
			$this->data['number_of_days_after_deployment'] = $number_of_days_after_deployment;

			if(isEqual($viewPage,'commission')) {
				if (!isset($this->commissionModel)) {
					$this->commissionModel = model('CommissionModel');
				}
				$this->data['commissions'] = $this->commissionModel->all([
					'commission.user_id' => $this->data['whoIs']->id
				]);
			}

			$this->data['viewPage'] = $viewPage;
			return $this->view('user/show' , $this->data);
		}

		public function sendCredential($id)
		{
			$this->model->sendCredential($id);
			Flash::set("Credentials has been set to the user");
			return request()->return();
		}

		public function toPartner($id) {
			$req = request()->get();
			
			if(isset($req['from']) && isEqual($req['from'],'admin')) {
				csrfValidate();

				$action = $req['action'] ?? 'accept';
				if(isEqual($action,'accept')) {
					Flash::set("User set to partner");
					$this->model->toPartner($id);
				} else {
					Flash::set("Application as partner declined");
					$this->model->toPartnerDecline($id);
				}
				return request()->return();
				
			}

			$this->model->update([
				'verifier_application_status' => 'pending'
			], $id);
			return request()->return();
		}

		public function removePartner($id) {
			$this->model->removePartner($id);
			Flash::set("User removed as partner");
			return request()->return();
		}

		public function verifierApplication() {
			$this->data['users_for_approvals'] = $this->model->getAll([
				'where' => [
					'verifier_application_status' => [
						'condition' => 'not null'
					]
				],
				'order' => "FIELD(verifier_application_status,'pending','declined','approved')"
			]);
			return $this->view('user/verifiers', $this->data);
		}

		public function verifyRegistration() {
			$req = request()->get();

			if(!isset($req['payload'])) {
				Flash::set("Unknown request, Welcome to " . COMPANY_NAME);
				return redirect(_route('auth:login'));
			}
			$payload = unseal($req['payload']);

			$difference = timeInMinutesToHours(timeDifference($payload['dateOfValidity'], timeNow()));

			if($difference >= 1) {
				Flash::set("Registration confirmation expired, you can re-request new confirmation link, use your email", 'danger');
				return redirect(_route('user:resend-verify-registration'));
			} else {
				$isOkay = $this->model->verifyUser($payload['userId']);

				if($isOkay) {
					Flash::set($this->model->getMessageString());
					if(isEqual(whoIs('id'), $payload['userId'])) {
						return redirect(_route('dashboard:index'));
					} else {
						Flash::set("Something went wrong");
						return redirect(_route('dasboard:idnex'));
					}
				} else {
					Flash::set($this->model->getErrorString(), 'danger');
					return redirect(_route('auth:login'));
				}
			}
		}

		/**
		 * use email
		 */
		public function resendVerifyRegistration() {
			if(isSubmitted()) {
				$post = request()->posts();
				$this->model->sendRegistrationConfirmation($post['email']);
				Flash::set("Confirmation has been re sent, You can close this page now");
				return redirect(_route('user:resend-verify-registration'));
			}
			$this->data['user_form']->init([
				'url' => _route('user:resend-verify-registration')
			]);
			$this->data['user_form']->setValue('submit', 'Resend Confirmation');
			$this->data['form'] = $this->data['user_form'];
			return $this->view('user/verify_registration', $this->data);
		}
	}