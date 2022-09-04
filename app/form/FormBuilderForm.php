<?php 

	namespace Form;

	use Core\Form;
	load(['Form'] , CORE);

	class FormBuilderForm extends Form
	{

		public function __construct()
		{
			parent::__construct();

			$this->name = 'FORM_BUILDER';

			$this->init([
				'url' => _route('form:create')
			]);

			$this->addFormName();
			$this->addFormDescription();
			$this->addLabel();
			$this->addDescription();
			$this->addType();
			$this->addDefault();
			$this->addOptions();

			$this->customSubmit('Save');
		}


		/*
		*use to name form
		*/
		public function addFormName()
		{
			$this->add([
				'type' => 'text',
				'name' => 'name',
				'class' => 'form-control',
				'required' => true,
				'options' => [
					'label' => 'Form Name'
				]
			]);
		}
		

		/*
		*use to add description to form
		*/
		public function addFormDescription()
		{
			$this->add([
				'type' => 'textarea',
				'name' => 'description',
				'class' => 'form-control',
				'required' => true,
				'options' => [
					'label' => 'Form Description'
				]
			]);
		}

		public function addDescription()
		{
			$this->add([
				'type' => 'textarea',
				'name' => 'item_description',
				'class' => 'form-control',
				'required' => true,
				'options' => [
					'label' => 'Description'
				]
			]);
		}

		public function addLabel()
		{
			$this->add([
				'type' => 'text',
				'name' => 'label',
				'class' => 'form-control',
				'required' => true,
				'options' => [
					'label' => 'Input Label'
				]
			]);
		}

		public function addType()
		{
			$this->add([
				'type' => 'select',
				'name' => 'type',
				'class' => 'form-control',
				'required' => true,
				'options' => [
					'label' => 'Input Type',
					'option_values' => [
						'date' , 'dropdown' , 'short answer' , 
						'long answer'
					]
				],
				'attributes' => [
					'id' => 'id_type',
					'data-target' => '#id-options'
				]
			]);
		}

		public function addDefault()
		{
			$this->add([
				'type' => 'text',
				'name' => 'default_value',
				'class' => 'form-control',
				'options' => [
					'label' => 'Default Input'
				]
			]);
		}

		public function addOptions()
		{
			$this->add([
				'type' => 'text',
				'name' => 'options',
				'class' => 'form-control',
				'options' => [
					'label' => 'Options (Seperate Items By Comma (,))'
				],
				'attributes' => [
					'id' => 'id-options'
				]
			]);
		}
	}