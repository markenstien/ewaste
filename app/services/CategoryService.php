<?php
    namespace Services;
    class CategoryService {
        const ITEM = 'ITEMS';
        const COMMON_TRANSACTIONS = 'COMMON_TRANSACTIONS';
        const PETTY = 'PETTY_CASH';
        const CANCEL_REASON = 'CANCEL_REASON';


        public static $model = null;

        public static function getAll($params = []) {
            if(is_null(self::$model)) {
                self::$model = model('CategoryModel');
            }
            $limit = null;
            $where = [
                'category' => self::ITEM
            ];

            if(isset($params['where'])) {
                $where = array_merge($params['where'], $where);
            }
            if(isset($params['limit'])) {
                $limit = "{$params['limit']}";
            }

            $categories = self::$model->all(['category'=> CategoryService::ITEM],'*','name asc', $limit);
            
            return $categories;
        }
    }