<?php 
    namespace Classes\Entity;

    abstract class AbstractEntity {
        public function convertItems($productArray = []) {
            $retVal = [];
            foreach ($productArray as $key => $row) {
                $this->initConvert($row);
                $retVal[] = $this->toMap();            
            }

            return $retVal;
        }
        public function toMap() {
            $object = (object) [];
            foreach($this as $key => $row) {
                $object->$key = $row;
            }
            return $object;
        }

        abstract function initConvert($convertData);
    }