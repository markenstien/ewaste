<?php
    namespace Classes\Entity;
    use Classes\Entity\AbstractEntity;
    load(['AbstractEntity'], CLASSES.DS.'Entity');

    class Product extends AbstractEntity{
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
        public $isPartnerVerified;

        public function initConvert($convertData) {
            $this->id = _convert($convertData->id, 'int');
            $this->title = $convertData->name;
            $this->description = $convertData->remarks;
            $this->price = _convert($convertData->sell_price, 'double');
            $this->images = $convertData->images;
            $this->badge = "test only";
            $this->rating = _convert($convertData->rating ?? floatval(ceil(rand(1,5))), 'double');
            $this->totalReview = _convert($convertData->review ?? intval(rand(1,5)), 'int');
            $this->quantity = _convert($convertData->total_stock, 'int');
            $this->isAddedToWishList = false;
            $this->isPartnerVerified = $convertData->is_partner_verified;
        }
        
    }