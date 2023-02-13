<?php 

    class TaxModel extends Model
    {
        public $table = 'taxes';


        public function updateTax($taxData) 
        {
            $date = now();

            if($taxData['tax_percentage'] > 100 || $taxData['tax_percentage'] < 0) {
                $this->addError("Invalid Tax Percentage");
                return false;
            }  

            $lastInstance = parent::lastId();

            if(!$lastInstance) {
                //create
                $taxId = parent::store([
                    'tax_percentage' => $taxData['tax_percentage'],
                    'updated_at'  => $date
                ]);
            } else {
                    
                parent::update([
                    'is_active' => false
                ], [
                    'is_active' => true
                ]);

                $taxId = parent::store([
                    'tax_percentage' => $taxData['tax_percentage'],
                    'updated_at'  => $date]);
            }

            return $taxId;
        }
        public function current() {
            return parent::last()->tax_percentage ?? 0;
        }
    }