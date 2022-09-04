<?php 
	
	use Form\FormBuilderForm;
	load(['FormBuilderForm'] , APPROOT.DS.'form');

	class FormBuilderController extends Controller
	{

		public function __construct()
		{
			$this->form = new FormBuilderForm();
			$this->model = model('FormBuilderModel');
		}

		public function index()
		{
			$this->data['page_title'] = " Forms ";
			$this->data['forms'] = $this->model->getAssoc('name');

			return $this->view('form_builder/index' , $this->data);
		}

		public function create()
		{

			if( isSubmitted() )
			{
				$post = request()->posts();

				$res = $this->model->create($post);

				if($res) {
					Flash::set("Form {$post['name']} has been created");
					return redirect( _route('form:show' , $res));
				}else{
					Flash::set("Create form failed");
					return request()->return();
				}
			}

			$this->data['title'] = ' FORM BUILDER ';
			$this->data['form'] = $this->form;

			return $this->view('form_builder/create' , $this->data);
		}

		public function show($id)
		{
			$form = $this->model->getComplete($id);

			$this->data['title'] = ' Form-Overview ';
			$this->data['form_data'] = $form;

			$this->data['form_builder_items'] = $form->items;

			return $this->view('form_builder/show' , $this->data);
		}

		public function edit($id)
		{

			if( isSubmitted() )
			{
				$post = request()->posts();

				$res = $this->model->update($post , $id);

				if(!$res) {
					Flash::set("Something went wrong" , 'danger');
					return request()->return();
				}else{
					Flash::set("Form Builder updated");
					return redirect( _route('form:show' , $id) );
				}
			}

			$form = $this->model->getComplete($id);

			$this->form->setValueObject($form);
			$this->form->addId($id);
			$this->data['form']  = $this->form;

			$this->data['title'] = ' Form-Overview ';
			$this->data['form_data'] = $form;
			$this->data['form_builder_items'] = $form->items;
			$this->data['form_id'] = $form->id;

			return $this->view('form_builder/edit' , $this->data);
		}

		public function addItem()
		{
			$form_id = request()->input('form_id');

			if( isSubmitted() )
			{
				$post = request()->posts();

				$res = $this->model->addItem( $post , $form_id );

				if(!$res) {
					Flash::set( $this->model->getErrorString() , 'danger');
					return request()->return();
				}

				Flash::set("Form Item added");
				return redirect( _route('form:show' , $form_id) );
			}

			if( empty($form_id) )
			{
				Flash::set("Invalid request");
				return request()->return();
			}

			$this->data['form'] = $this->form;
			$this->data['form_id'] = $form_id;

			return $this->view('form_builder/add_item' , $this->data);
		}

		public function editItem($id)
		{

			if( isSubmitted() )
			{
				$post = request()->posts();

				$res = $this->model->updateItem( $post , $post['id']);

				if(!$res) {
					Flash::set( $this->model->getErrorString() , 'danger');
					return request()->return();
				}

				Flash::set("Item Updated!");

				return redirect(_route('form:show' , $post['form_id']));
			}

			$item = $this->model->getItem($id);

			$item_options = implode(',' , $item->options);

			$this->form->setValueObject( $item );
			$this->form->setValue('options' , $item_options);
			$this->form->addId($item->id);


			$this->data['page_title'] = " Edit Form Item";
			$this->data['form'] = $this->form;
			$this->data['item'] = $item;
			$this->data['form_id'] = $item->form_id;

			return $this->view('form_builder/edit_item' , $this->data);
		}

		public function deleteItem($item_id)
		{
			$res = $this->model->deleteItem( $item_id );
			Flash::set( $this->model->getMessageString() );
			return request()->return();
		}

		public function destroy($id)
		{

			$this->model->delete($id);

			Flash::set("Form deleted");

			return redirect( _route('form:index') );
		}
	}