<?php 

	class QueueModel extends Model
	{
		public $table = 'queueing';

		public function new()
		{
			$new_number = $this->createNewNumber();
			$this->new_number = $new_number;


			$this->addMessage("#{$this->new_number} is queued");
			return parent::store([
				'number_decimal' => $new_number,
				'status' => 'waiting'
			]);
		}

		public function createNewNumber()
		{
			$last = $this->getLast();

			if( !$last )
				return 1;

			$number_decimal = intval($last->number_decimal);

			return ++$number_decimal;
		}

		public function getLast()
		{
			$ret_val = parent::single(null, '*' , 'number_decimal desc');

			return $ret_val;
		}

		public function complete($id)
		{
			return parent::update([
				'status' => 'completed'
			],$id);
		}

		public function getWaitingAndServing()
		{
			$waiting = $this->getAll([
				'where' => [
					'status' => 'waiting'
				],
				'order' => 'updated_at asc'
			]);

			$serving = $this->getAll([
				'where' => [
					'status' => 'serving'
				],
				'order' => 'updated_at asc'
			]);


			return [
				'serving' => $serving,
				'waiting' => $waiting
			];
		}

		public function getTotalServed()
		{
			$this->db->query(
				"SELECT count(id) as total from {$this->table}"
			);

			return $this->db->single()->total ?? 0;
		}

		public function getAll( $params = [])
		{
			$where = null;
			$order = null;

			if( isset($params['where']) )
				$where = " WHERE ".$this->conditionConvert( $params['where'] );

			if( isset($params['order']) )
				$order = " ORDER BY ".$params['order'];

			$this->db->query(
				"SELECT * FROM {$this->table}
					{$where} {$order} "
			);

			return $this->db->resultSet();
		}

		public function reset()
		{
			$this->db->query(
				"truncate {$this->table}"
			);

			$this->db->execute();
		}
	}