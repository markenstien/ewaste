<?php 
    namespace Classes\Entity;
    use Classes\Entity\AbstractEntity;
    load(['AbstractEntity'], CLASSES.DS.'Entity');

    class Cart extends AbstractEntity
    {
        public $id;//int
        public $title; //productname
        public $description;
        public $price;//double
        public $badges;
        public $rating;
        public $totalReview;
        public $quantity;
        public $isAddedToWishList;
        public $userId;

        public function initConvert($convertData) {
            $this->userId = $convertData->user_id;
            $this->id = $convertData->id;
            $this->title = $convertData->name;
            $this->description = $convertData->remarks;
            $this->price = $convertData->sell_price;
            $this->badges = "new product";
            $this->images = $convertData->images;
            $this->rating = _convert($convertData->rating ?? floatval(ceil(rand(1,5))), 'double');
            $this->totalReview = _convert($convertData->review ?? intval(rand(1,5)), 'int');
            $this->quantity = $convertData->quantity;
            $this->isAddedToWishList = false;
        }
    }