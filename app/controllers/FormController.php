<?php 
	use Form\FormBuilderForm;
	load(['FormBuilderForm'] , APPROOT.DS.'form');

	class FormController extends Controller
	{

		public function __construct()
		{
			$this->form_builder_model = model('FormBuilderModel');
			$this->model = model('FormRespondentModel');

			$this->form = new FormBuilderForm();
		}


		public function show($id)
		{
			$form = $this->model->get($id);

			$this->data['form_data'] = $form;
			$this->data['item_array'] = $form->item_array;

			return $this->view('form/show' , $this->data);
		}

		public function respond( $form_builder_id )
		{

			if( isSubmitted() )
			{
				$post = request()->posts();

				$res = $this->model->create($post);

				if( !$res) {
					Flash::set("Something went wrong!", 'danger');
					return request()->return();
				}

				Flash::set("Saved");
				return redirect('form:show' , $res);
			}

			$form = $this->form_builder_model->getComplete($form_builder_id);

			$this->data['form_data'] = $form;
			$this->data['form'] = $this->form;

			$this->data['page_title'] = " Responded to {$form->name} ";

			return $this->view('form/respond' , $this->data);
		}
	}