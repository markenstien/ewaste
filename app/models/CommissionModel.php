<?php

    class CommissionModel extends Model
    {
        public $table = 'commissions';
        public $_fillables = [
            'user_id',
            'amount',
            'order_id',
            'status',
            'release_date',
            'updated_at',
            'created_at'
        ];

        public function createOrUpdate($data, $id = null) {
            $_fillables = parent::getFillablesOnly($data);

            if (is_null($id)) {
                return parent::store($_fillables);
            } else {
                return parent::update($_fillables, $id);
            }
        }

        public function all($where = null, $fields = '*', $order_by = null, $limit = null) {

            if(!is_null($where)) {
                $where = " WHERE ".parent::conditionConvert($where);
            }

            if(!is_null($order_by)) {
                $order_by = " ORDER BY {$order_by}";
            }

            $this->db->query(
                "SELECT commission.*, commission.created_at as commission_date,
                    orders.reference as order_reference 
                    FROM {$this->table} as commission
                    LEFT JOIN orders 
                    ON orders.id = commission.order_id
                    {$where} {$order_by}"
            );

            return $this->db->resultSet();
        }

        public function getAvailableCommissions($userId = null) {
            $where = null;

            if(!is_null($userId)) {
                $where = " WHERE commission.user_id = '{$userId}' ";
            }
            $this->db->query(
                "SELECT commission.user_id as user_id, SUM(amount) as total_amount, concat(user.firstname, ' ',user.lastname) as name
                    FROM {$this->table} as commission
                    LEFT JOIN users as user 
                    ON user.id = commission.user_id
                    {$where}
                    GROUP BY commission.user_id"
            );

            if(!is_null($userId))
                return $this->db->single();

            return $this->db->resultSet();
        }

        public function release($userId, $amount) {
            $checkAmountAvailable = $this->getAvailableCommissions($userId);
            if($checkAmountAvailable->total_amount < $amount) {
                $this->addError("Insufficient funds.");
                return false;
            }
            $this->store([
                'user_id' => $userId,
                'amount' => $amount * -1,
                'order_id' => null,
                'release_date' => now()
            ]);
            return true;
        }
    }