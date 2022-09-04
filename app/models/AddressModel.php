<?php 

	class AddressModel extends Model
	{
		public $table = 'address';

		public $_fillables = [
			'block_house_number',
			'street',
			'barangay',
			'city',
			'zip',
		];

		public function update($address_data , $id)
		{
			$_fillables = $this->getFillablesOnly($address_data);
			parent::update( $_fillables , $id);
			return $id;
		}

		public function create($address_data)
		{
			$_fillables = $this->getFillablesOnly($address_data);

			$address_id = parent::store($_fillables);

			if($address_id) {
				$this->dbHelper->insert('module_address' , [
					'module_key' => $address_data['module_key'],
					'module_id' => $address_data['module_id'],
					'address_id' => $address_id,
				]);
			}else{
				$this->addError("Error creating Address ");
				return false;
			}

			return $address_id;
		}

		public function getByModuleAndId( $module , $module_id )
		{
			return $this->getAll([
				'where' =>  [
					'module_key' => $module,
					'module_id' => $module_id,
				]
			]);
		}


		public function getAll($params = [])
		{
			$where = null;
			$order = null;

			if( isset($params['where']) )
				$where = " WHERE ".$this->conditionConvert($params['where']);
			if( isset($params['order']) )
				$order = " ORDER BY {$params['order']} ";


			$this->db->query(
				"SELECT * , concat(block_house_number , ' ' , street , ' ' ,barangay,',',city ,' ZIP ',zip) 
					as complete_address , address.id as id 
					FROM address
					LEFT JOIN module_address as md 
					ON address.id = md.address_id
					{$where} {$order}"
			);

			return $this->db->resultSet();
		}

	}