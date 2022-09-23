<?php
    namespace Classes\Entity;
    class Product {
        public $id;
        public $title;
        public $description;
        public $price;
        public $images = [];
        public $badge;
        public $rating;
        public $totalReview;
        public $quantity;
        public $isAddedToWishList;

        public function initConvert($productData) {
            $this->id = _convert($productData->id, 'int');
            $this->title = $productData->name;
            $this->description = $productData->remarks;
            $this->price = _convert($productData->sell_price, 'double');
            $this->images = $productData->images;
            $this->badge = "test only";
            $this->rating = _convert($productData->rating ?? floatval(ceil(rand(1,5))), 'double');
            $this->totalReview = _convert($productData->review ?? intval(rand(1,5)), 'int');
            $this->quantity = _convert($productData->total_stock, 'int');
            $this->isAddedToWishList = false;
        }

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
    }