<?php 

    class CommissionReleaseModel extends Model
    {
        public $table = 'commission_releases';
        public static $RELEASE_BASIC_AMOUNT = 100;

        public function release($id = null) {
            if(!isset($this->commissionModel)) {
                $this->commissionModel = model('CommissionModel');
            }

            if(is_null($id)) {
                $availbleCommisions = $this->commissionModel->getAvailableCommissions();
                foreach($availbleCommisions as $key => $row) {
                    if($row->total_amount > self::$RELEASE_BASIC_AMOUNT) {
                        $this->releaseInput([
                            'user_id' => $row->user_id,
                            'amount' => $row->total_amount,
                            'status' => 'pending'
                        ]);
                    }
                }

                if (!empty($this->getErrors())) {
                    $this->addMessage($this->getErrorString());
                    return false;
                }
            } else {
                $availbleCommisions = $this->commissionModel->getAvailableCommissions($id);
                if($availbleCommisions->total_amount > self::$RELEASE_BASIC_AMOUNT) {
                    return $this->releaseInput([
                        'user_id' => $availbleCommisions->user_id,
                        'amount' => $availbleCommisions->total_amount,
                        'status' => 'pending'
                    ]);
                }
            }
            $this->addMessage("Release Request Approved");
            return true;
        }

        public function releaseInput($relaseData = null) {
            $res = parent::single([
                'user_id' => $relaseData['user_id'],
                'status' => 'pending'
            ]);

            if($res) {
                $this->addError("Some users has pending release commission request, settle those request first then redo release request");
                return false;
            } else {
                $this->addMessage("Realest Request submitted");
            }

            return parent::store($relaseData);
        }

        public function deployRelease($relaseId) {
            if(!isset($this->commissionModel)) {
                $this->commissionModel = model('CommissionModel');
            }
            $releaseRequest = parent::get($relaseId);
            if($releaseRequest) {
                $res = $this->commissionModel->release($releaseRequest->user_id, $releaseRequest->amount);
                if(!$res) {
                    $this->addError($this->commissionModel->getErrorString());
                    return false;
                }
                $this->update([
                    'status' => 'approved'
                ], $relaseId); 
                $this->addMessage("Release Success");
                return true;
            } else {
                $this->addError("Release ID not found");
                return false;
            }
        }

        public function cancelRelease($releaseId) {
            return parent::update([
                'status' => 'declined'
            ], $releaseId);
        }

        public function getAll($params = []) {
            $where = null;
            $order = null;

            if (isset($params['where'])) {
                $where = " WHERE ".parent::conditionConvert($params['where']);
            }

            if (isset($params['order'])) {
                $order = " ORDER BY {$params['order']}";
            }
            
            $this->db->query(
                "SELECT request.*,
                    concat(firstname, ' ',lastname) as name
                FROM {$this->table} as request
                LEFT JOIN users as user 
                ON user.id = request.user_id
                {$where}{$order}"
            );
            return $this->db->resultSet();
        }
    }