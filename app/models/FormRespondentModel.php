<?php

	class FormRespondentModel extends Model
	{
		public $table = 'form_respondents';

		protected $_fillables = [
			'reference' , 'form_id',
			'user_id' , 'items',
			'form_detail',
			'created_at'
		];

		public function create( $form_respondent_data )
		{
			$items = $this->convertItem($form_respondent_data['items']);

			$form_respondent_data['items'] = $items;
			$form_respondent_data['form_detail'] = $this->convertItem($form_respondent_data['form']);

			$form_respondent_data['reference'] = $this->getReference();


			$_fillables = $this->getFillablesOnly($form_respondent_data);

			return parent::store($_fillables);
		}

		public function get($id)
		{
			$form_respond = parent::get($id);

			if(!$form_respond){
				$this->addError("Form Respond not found!");
				return false;
			}

			$form_respond->form_detail_array = [];
			$form_respond->item_array = [];


			$form_respond->form_detail_array = $this->convertItem($form_respond->form_detail , 'decode');
			$form_respond->item_array = $this->convertItem($form_respond->items , 'decode');
			
			return $form_respond;
		}

		public function convertItem($items , $encoding = 'encode')
		{
			if( isEqual($encoding , 'encode') ){
				return json_encode($items);
			}else{
				return json_decode($items);
			}
		}

		public function getReference()
		{
			return strtoupper('RES-'.random_number(8));
		}
	}