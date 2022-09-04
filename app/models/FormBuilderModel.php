<?php 

	class FormBuilderModel extends Model
	{
		public $table = 'forms';

		public $_fillables = [
			'reference' , 'name',
			'description'
		];

		public function getItem($id)
		{
			$this->item_model = model('FormBuilderItemModel');

			$item = $this->item_model->get($id);
			
			return $item;
		}

		public function addItem($form_builder_item_data , $form_id)
		{
			$this->item_model = model('FormBuilderItemModel');

			$form_builder_item_data['form_id'] = $form_id;

			$res = $this->item_model->create($form_builder_item_data);

			if(!$res) {
				$this->addError( $this->item_model->getErrorString() );
				return false;
			}

			return $res;
		}


		public function updateItem($form_builder_item_data , $id)
		{
			$this->item_model = model('FormBuilderItemModel');

			$res = $this->item_model->update( $form_builder_item_data , $id);

			if(!$res) {
				$this->addError( $this->item_model->getErrorString() );
				return false;
			}

			return $res;
		}

		public function deleteItem($item_id)
		{
			$this->item_model = model('FormBuilderItemModel');

			$this->item_model->delete($item_id);

			$this->addMessage("Item Deleted");

			return true;
		}


		public function create( $form_data )
		{
			$form_data['reference'] = $this->getReference();
			$_fillables = $this->getFillablesOnly($form_data);
			$_fillables['order_num'] = $this->createOrderNum();

			return parent::store($_fillables);
		}



		public function createOrderNum()
		{
			$last = $this->last();
			$order_number = 0;
			if($last)
				$order_number = $last->order_num;

			++$order_number;

			return $order_number;
		}

		public function update( $form_data , $id )
		{
			$_fillables = $this->getFillablesOnly($form_data);

			return parent::update($_fillables , $id);
		}

		public function getReference()
		{
			return strtoupper('FRM-'.random_number(6));
		}

		public function getComplete($id)
		{
			$form_builder = parent::get($id);

			if(!$form_builder){
				$this->addError("Form Builder does not exists");
				return false;
			}

			$form_builder_item_model = model('FormBuilderItemModel');

			$items = $form_builder_item_model->getByForm($id);

			$form_builder->items = $items;

			return $form_builder;
		}

		public function delete($id)
		{
			parent::delete($id);

			$this->db->query(
				"DELETE FROM form_items
					WHERE form_id = '{$id}' "
			);

			return $this->db->execute();
		}
	}