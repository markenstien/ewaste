<?php

	use Services\UserService;
	load(['UserService'], SERVICES);

	class UserModel extends Model
	{
		public $table = 'users';

		protected $_fillables = [
			'id',
			'username',
			'password',
			'email',
			'firstname',
			'lastname',
			'phone',
			'gender',
			'user_type',
			'address',
			'is_verified',
			'is_partner',
			'profile',
			'created_at',
			'created_by',
			'verifier_application_status'
		];


		public $_public = [
			'id',
			'username',
			'email',
			'phone',
			'firstname',
			'lastname',
			'is_verified',
			'is_partner',
			'verifier_application_status'
		];

		public function save($user_data , $id = null)
		{
			$user_id = $id;
			$fillable_datas = $this->getFillablesOnly($user_data);
			$validated = $this->validate($fillable_datas, $id);

			if(!$validated)
				return false;

			if(!is_null($id))
			{
				//change password also
				if(empty($fillable_datas['password']) )
					unset($fillable_datas['password']);
					
				$res = parent::update($fillable_datas , $id);
				if(isset($user_data['profile'])){
					$this->uploadProfile('profile' , $id);
				}
				$user_id = $id;
				$this->addMessage(self::MESSAGE_UPDATE_SUCCESS);
			} else {
				if(!isset($user_data['username'])) {
					$fillable_datas['username'] = substr($user_data['firstname'],1) .''. substr($user_data['lastname'], 1);
					$fillable_datas['username'] = strtoupper($fillable_datas['username'].random_number(4));
				}

				$user_id = parent::store($fillable_datas);
				$this->addMessage(self::MESSAGE_CREATE_SUCCESS);
			}
			
			return $user_id;
		}


		public function sendCredential($id)
		{
			$user = parent::get($id);

			$app_name = COMPANY_NAME;

			$login_href = URL.DS._route('auth:login');

			$anchor = "<a href='{$login_href}'>Login here.</a>";
			/**
			 * send auth to email*/
			$body = <<<EOF
				<div>
					Hi {$user->firstname} , Your Credentials
					for the {$app_name} Portal <br/>
					<strong>username/email : {$user->email}  </strong> <br/>
					<strong>password : {$user->password}  </strong>
					{$anchor}
				</div>
			EOF;

			_mail($user->email, 'User Credential' , $body);
		}

		public function resetPasswordRequest($email) {
			$user = parent::get([
				'email' => $email
			]);

			if(!$user) {
				$this->addError("No user found, forget password failed");
				return false;
			}
			//email
			$tmpPassword = random_number(5);
			//send to email.
		}

		private function validate($user_data , $id = null)
		{
			if(!empty($user_data['email']))
			{
				$is_exist = $this->getByKey('email' , $user_data['email'])[0] ?? '';        	

				if( $is_exist && !isEqual($is_exist->id , $id) ){
					$this->addError("Email {$user_data['email']} already used");
					return false;
				}
			}

			// if(!empty($user_data['username']))
			// {
			// 	$is_exist = $this->getByKey('username' , $user_data['username'])[0] ?? '';

			// 	if( $is_exist && !isEqual($is_exist->id , $id) ){
			// 		$this->addError("Username {$user_data['username']} already used");
			// 		return false;
			// 	}
			// }

			if(!empty($user_data['phone_number']))
			{
				$is_exist = $this->getByKey('phone_number' , $user_data['phone_number'])[0] ?? '';

				if( $is_exist && !isEqual($is_exist->id , $id) ){
					$this->addError("Phonne Number {$user_data['phone_number']} already used");
					return false;
				}
			}

			return true;
		}

		public function create($user_data , $profile = '')
		{
			$res = $this->save($user_data);
			if(!$res) {
				$this->addError("Unable to create user");
				return false;
			}
			if(!empty($profile) )
				$this->uploadProfile($profile , $res);

			$this->addMessage("User {$user_data['firstname']} Created");
			return $res;
		}

		public function register($user_data, $profile = '') {
			$user_data['is_verified'] = false;
			$createUser = $this->create($user_data , $profile);

			if($createUser) {
				//send confirmation link
				$this->sendRegistrationConfirmation($user_data['email']);

				return $createUser;
			} else {
				return false;
			}
		}

		public function sendRegistrationConfirmation($email) {
			$user = parent::single([
				'email' => $email
			]);

			if(!$user)
				return false;

			$app_name = COMPANY_NAME;
				$login_href = URL.DS._route('user:verify-registration', null, [
					'payload' => seal([
						'userId' => $user->id,
						'dateOfValidity' => nowMilitary()
					])
				]);
				$anchor = "<a href='{$login_href}'>Confirm my registration</a>";
				/**
				 * send auth to email*/
				$body = <<<EOF
					<div>
						Hi {$user->id} , Thank you for your registration.
						To start selling and buying to {$app_name}
						Click the link below, to verify your account. 
						<div>Important: If you have not created this account, please ignore the link.</div>
						{$anchor}
					</div>
				EOF;

				_mail($user->email, 'User Credential' , $body);
			return true;
		}
		public function uploadProfile($file_name , $id)
		{
			$is_empty = upload_empty($file_name);

			if($is_empty){
				$this->addError("No file attached upload profile failed!");
				return false;
			}
			
			$upload = upload_image($file_name, PATH_UPLOAD);
			
			if( !isEqual($upload['status'] , 'success') ){
				$this->addError(implode(',' , $upload['result']['err']));
				return false;
			}
			$res = parent::update([
				'profile' => GET_PATH_UPLOAD.DS.$upload['result']['name']
			] , $id);

			if($res) {
				if(isEqual(whoIs('id'), $id)) {
					$this->startAuth($id);					
				}
				$this->addMessage("Profile uploaded!");
				return true;
			}
			$this->addError("UPLOAD PROFILE DATABASE ERROR");
			return false;
		}

		public function update($user_data , $id)
		{
			$res = $this->save($user_data , $id);
			if(!$res) {
				$this->addError("Unable to update user");
				return false;
			}
			if(isset($user_data['first_name'])) {
				$this->addMessage("User {$user_data['first_name']} has been updated!");
			}
			return true;
		}

		public function verifyUser($userId) {
			$user = parent::get($userId);

			if($user->is_verified) {
				$this->addError("User is already verified");
				return false;
			} else {
				parent::update([
					'is_verified' => true
				], $userId);

				if(isEqual(whoIs('id'), $userId)) {
					$this->startAuth($userId);
				} 

				$this->addMessage("User Verified");
				return true;
			}
		}

		public function getByKey($column , $key , $order = null)
		{
			if( is_null($order) )
				$order = $column;

			return parent::getAssoc($column , [
				$column => "{$key}"
			]);
		}


		public function getAll($params = [])
		{
			$where = null;
			$order = " firstname asc ";

			if(isset($params['order']))
				$order = " {$params['order']}";
			if(isset($params['where']))
				$where = $this->conditionConvert($params['where']);

			return parent::all($where, $params['fields'] ?? '*', $order);
		}


		public function initState($userId) {

		}

		public function generateCode($user_type)
		{
			$pfix = null;

			switch(strtolower($user_type))
			{
				case 'admin':
					$pfix = 'SUPER';
				break;

				case 'patient':
					$pfix = 'PT';
				break;

				case 'doctor':
					$pfix = 'DR';
				break;
			}

			$last_id = $this->last()->id ?? 000;

			return strtoupper($pfix.get_token_random_char(4).$last_id);
		}


		public function authenticate($email , $password)
		{
			$errors = [];

			$user = parent::single(['email' => $email]);

			if(!$user) {
				$errors[] = " Email '{$email}' does not exists in any account";
			}

			if(!isEqual($user->password ?? '' , $password)){
				$errors[] = " Incorrect Password ";
			}

			if(!empty($errors)){
				$this->addError( implode(',', $errors));
				return false;
			}

			return $this->startAuth($user->id);
		}

		/*
		*can be used to reset and start auth
		*/
		public function startAuth($id)
		{
			$user = parent::get($id);

			if(!$user){
				$this->addError("Auth cannot be started!");
				return false;
			}

			$auth = null;

			while(is_null($auth))
			{
				Session::set('auth' , $user);
				$auth = Session::get('auth');
			}

			return $auth;
		}

		public function computeAge($birth_date)
		{
			$currentDate = date("d-m-Y");

			$age = date_diff(date_create($birth_date), date_create($currentDate));

			return $age->format("%y");
		}

		public function getPatients()
		{
			
		}

		public function totalUser(){
			$staff = [UserService::VENDOR_STAFF, UserService::CONSUMER];

			$this->db->query(
				"SELECT count(id) as total
					FROM {$this->table}
					WHERE user_type in ('".implode("','", $staff)."') "
			);
			return $this->db->single()->total ?? 0;
		}

		public function getSummary()
		{
			$patients = $this->getAll([
				'where' => [
					'user_type' => 'patient'
				]
			]);

			$summary = [
				'gender' => [
					'male' => 0,
					'female' => 0,
					'male_percentage' => 0,
					'female_percentage' => 0
				],

				'age_group' => [
					'20s' => '',
					'30s' => '',
					'40s' => '',
					'others' => ''
				]
			];

			foreach($patients as $key => $row) 
			{
				$age = intval($row->age);

				if( isEqual($row->gender, 'male') ){
					$summary['gender']['male']++;
				}else{
					$summary['gender']['female']++;
				}

				
				if( $age >= 40)
				{
					$summary['age_group']['40s']++;
				}else if($age >= 30){
					$summary['age_group']['30s']++;
				}else if($age >= 20)
				{
					$summary['age_group']['20s']++;
				}else{
					$summary['age_group']['others']++;
				}
			}

			//gender summary

			$gender_total = intval($summary['gender']['male']) + intval($summary['gender']['female']);

			if( $summary['gender']['male'] )
				$summary['gender']['male_percentage'] = ($summary['gender']['male'] / $gender_total) * 100;

			if( $summary['gender']['female'] )
				$summary['gender']['female_percentage'] = ($summary['gender']['female'] / $gender_total) * 100;

			return $summary;
		}

		public function toPartner($id) {
			return parent::update([
				'is_partner' => nowMilitary(),
				'verifier_application_status' => 'approved'
			], $id);
		}

		public function toPartnerDecline($id) {
			return parent::update([
				'is_partner' => removeVerifierValue(),
				'verifier_application_status' => 'declined'
			], $id);
		}

		public function removePartner($id) {
			return parent::update([
				'is_partner' => removeVerifierValue()
			], $id);
		}
		public function get($id, $fields = '*') {
			$user = parent::get($id);

			if(!$user) {
				$this->addError("User does not exist");
				return false;
			}

			if(!isEqual($user->is_partner, '0000-00-00 00:00:00')) {
				$user->is_a_partner = true;
			}else{
				$user->is_a_partner = false;
			}
			return $user;
		}
	}