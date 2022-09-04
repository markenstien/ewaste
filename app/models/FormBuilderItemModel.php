<?php 

	class FormBuilderItemModel extends Model 
	{
		public $table = 'form_items';

		public $_fillables = [
			'form_id' , 'label',
			'type' , 'default_value',
			'item_description' , 'options',
			'attributes' , 'created_at'
		];

		public function create($form_builder_item_data)
		{
			if(!$this->validateDropdown($form_builder_item_data)) return false;

			$_fillables = $this->getFillablesOnly($form_builder_item_data);
			$_fillables['options'] = $this->convertOptions($form_builder_item_data['options']);

			return parent::store( $_fillables );
		}


		public function update($form_builder_item_data , $id)
		{
			$_fillables = $this->getFillablesOnly($form_builder_item_data);
			
			if( isset($_fillables['options']))
			{
				$_fillables['options'] = $this->convertOptions($form_builder_item_data['options']);

				if(!$this->validateDropdown($form_builder_item_data)) return false;
			}
			
			return parent::update( $_fillables , $id);
		}


		public function validateDropdown($form_builder_item_data)
		{
			if( isEqual($form_builder_item_data['type'], 'dropdown') && empty($form_builder_item_data['options'])){
				$this->addError("Input type dropdown must have options");
				return false;
			}

			return true;
		}

		public function get( $id )
		{
			$item = parent::get($id);

			if(!$item){
				$this->addError("Item not found!");
				return false;
			}

			if( !empty($item->options ))
				$item->options = $this->convertOptions( $item->options , 'decode');
			return $item;
		}

		public function convertOptions( $options , $encoding = 'encode')
		{
			//always convert to array when encoding
			if( isEqual($encoding , 'encode') ){
				$options = trim($options);
				$options = explode(',' , $options);
				$options = array_map('trim', $options);
				return json_encode($options);
			}else{

				if(!empty($options))
					$options = json_decode($options);

				return $options;
			}
		}

		public function save($form_builder_item_data , $id = null )
		{
			
		}

		public function getByForm($form_id)
		{
			$this->db->query(
				"SELECT *  , fi.id as id 
					FROM {$this->table} as fi 
					LEFT JOIN forms as f 
					ON f.id = fi.form_id

					WHERE fi.form_id = '{$form_id}' 
					 "
			);

			$items = $this->db->resultSet();

			foreach($items as $item) {
				$item->options_array = [];

				if( isEqual($item->type, 'dropdown') && !empty($item->options) )
					$item->options_array = $this->convertOptions($item->options , 'decode');
		}

			return $items;
		}
	}