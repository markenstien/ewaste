<?php

	namespace Form;

	load(['Form'] , CORE);

	use Core\Form;

	class PatientForm extends Form
	{
		public function __construct()
		{
			parent::__construct();

			$this->name = 'patient_form';

			$this->init([
				'url' => _route('patient-record:create')
			]);

			$this->addBloodPresure();
			$this->addTemperature();
			$this->addPulseRate();
			$this->addRespiratorRate();
			$this->addHeight();
			$this->addWeight();
			$this->addOxygenLevel();
			$this->addFever();
			$this->addHeadache();
			$this->addBodyPain();
			$this->addSoreThroat();
			$this->addDiarrhea();
			$this->addLostTasteSmell();
			$this->addDificultyBreathing();
			$this->addDate();
			$this->addTime();
			$this->addCompletionStatus();


			$this->customSubmit('Save Record');
		}

		public function addBloodPresure()
		{
			$this->add([
				'type' => 'text',
				'name' => 'blood_presure_num',
				'class' => 'form-control',
				'options' => [
					'label' => 'Blood Presure'
				],
				'required' => true
			]);
		}

		public function addTemperature()
		{
			$this->inputTypeNum('temperature_num' , 'Temperature');
		}

		public function addPulseRate()
		{
			$this->inputTypeNum('pulse_rate_num' , 'Pulse Rate');
		}

		public function addRespiratorRate()
		{
			$this->inputTypeNum('respirator_rate_num' , 'Respirator Rate');
		}

		public function addHeight()
		{
			$this->inputTypeNum('height_num' , 'Height(cm)');
		}

		public function addWeight()
		{
			$this->inputTypeNum('weight_num' , 'Weight(kgs)');
		}

		public function addOxygenLevel()
		{
			$this->inputTypeNum('oxygen_level_num' , 'Oxygen Level');
		}

		public function addFever()
		{
			$this->inputTypeSelectYesOrNo('is_fever' , 'Has Fever?');
		}

		public function addHeadache()
		{
			$this->inputTypeSelectYesOrNo('is_headache' , 'Has Headache?');
		}

		public function addBodyPain()
		{
			$this->inputTypeSelectYesOrNo('is_body_pains' , 'Has Body Pain?');
		}

		public function addSoreThroat()
		{
			$this->inputTypeSelectYesOrNo('is_sore_throat' , 'Has Sore Throat?');
		}

		public function addDiarrhea()
		{
			$this->inputTypeSelectYesOrNo('is_diarrhea' , 'Has Diarrhea?');
		}

		public function addLostTasteSmell()
		{
			$this->inputTypeSelectYesOrNo('is_lost_of_taste_smell' , 'Lost of taste and smell?');
		}

		public function addDificultyBreathing()
		{
			$this->inputTypeSelectYesOrNo('is_dificulty_breathing' , 'Has Dificulty in Breathing?');
		}

		public function addDate()
		{
			$this->add([
				'name' => 'date',
				'type' => 'date',
				'required' => true,
				'class' => 'form-control',
				'options' => [
					'label' => 'Date'
				],
				'value' => date('Y-m-d')
			]);
		}
		public function addTime()
		{
			$this->add([
				'name' => 'time',
				'type' => 'time',
				'required' => true,
				'class' => 'form-control',
				'options' => [
					'label' => 'Time'
				],
				'value' => date('h:i:s')
			]);
		}

		public function addUser($id)
		{
			$this->add([
				'name' => 'user_id',
				'type' => 'hidden',
				'value' => $id,
				'required' => true,
			]);
		}

		public function addCompletionStatus()
		{
			$this->add([
				'type' => 'select',
				'name' => 'completion_status',
				'class' => 'form-control',
				'options' => [
					'label' => 'Completion Status',
					'option_values' => ['pending', 'finished', 'invalid']
				],
				'required' => true
			]);
		}

		// public function addCreatedBy($id)
		// {
		// 	$this->add([
		// 		'name' => 'created_by',
		// 		'type' => 'hidden',
		// 		'required' => true,
		// 	]);
		// }

		public function inputTypeSelectYesOrNo( $name , $label , $attributes = [])
		{
			$this->add([
				'type' => 'select',
				'name' => $name,
				'class' => 'form-control',
				'options' => [
					'label' => $label,
					'option_values' => ['1' => 'Yes' , '0' => 'No']
				],
				'required' => true
			]);
		}

		public function inputTypeNum( $name , $label ,$attributes = [] )
		{
			$this->add([
				'type' => 'number',
				'name' => $name,
				'class' => 'form-control',
				'options' => [
					'label' => $label
				],
				'required' => true
			]);
		}
	}