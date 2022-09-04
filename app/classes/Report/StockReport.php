<?php
    namespace Report;

    class StockReport{
        private $_items;

        public function setItems($items) {
            $this->_items = $items;
            return $this;
        }
    }