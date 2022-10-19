<?php
    load(['CategoryService'],SERVICES);
    use Services\CategoryService;

    class ItemModel extends Model
    {
        public $table = 'items';
        public $_fillables = [
            'user_id',
            'name',
            'sku',
            'barcode',
            'cost_price',
            'sell_price',
            'min_stock',
            'max_stock',
            'category_id',
            'variant',
            'remarks',
            'is_visible',
            'is_partner_verified'
        ];
        
        public function createOrUpdate($itemData, $id = null) {
            $retVal = null;
            $_fillables = $this->getFillablesOnly($itemData);

            if(isset($itemData['sku'])){
                $item = $this->getItemByUniqueKey($itemData['sku'], $itemData['name']);
            }

            if (!is_null($id)) {
                if (isset($item)) {
                    if($item && ($item->id != $id)) {
                        $this->addError("SKU Or Name Already exists");
                        return false;
                    }
                }
                
                $retVal = parent::update($_fillables, $id);
            } else {
                if(isset($item) && $item) {
                    $this->addError("SKU Or Name Already exists");
                    return false;
                }
                $retVal = parent::store($_fillables);
            }

            return $retVal;
        }

        public function getImages($id) {
            if(!isset($this->_attachmentModel)) {
                $this->_attachmentModel = model('AttachmentModel');
            }
            return $this->_attachmentModel->all([
                'global_id' => $id,
                'global_key' => CategoryService::ITEM
            ]);
        }


        private function getItemByUniqueKey($sku,$name) {
            return parent::single([
                'sku' => [
                    'condition' => 'equal',
                    'value' => $sku,
                    'concatinator' => 'OR'
                ],
                'name' => [
                    'condition' => 'equal',
                    'value' => $name
                ],
            ]);
        }

         /**
         * override Model:get
         */
        public function get($id, $fields = '*') {
            $productQuantitySQL = $this->_productTotalStockSQLSnippet();
            $this->db->query(
                "SELECT item.* , stock.total_stock as total_stock 
                    FROM {$this->table} as item 
                    LEFT JOIN (
                        $productQuantitySQL
                    ) as stock 
                    ON stock.item_id = item.id
                    WHERE id = '{$id}'"
            );

            return $this->db->single();
        }

        //ovveride all parent
        public function all($where = null, $fields = '*', $order_by = null, $limit = null) {
            $sqlSnippet = $this->_productTotalStockSQLSnippet();
            //aditional
            $where['is_deleted'] = false;

            $where = " WHERE ". $this->conditionConvert($where);

            if(!is_null($order_by)) {
                $order_by = " ORDER BY {$order_by}";
            }

            if(!is_null($limit)) {
                $limit = " LIMIT {$limit}";
            }

            $this->db->query(
                "SELECT item.*,ifnull(stock.total_stock,0) as total_stock FROM {$this->table} as item
                    LEFT JOIN ({$sqlSnippet}) as stock
                    ON stock.item_id = item.id
                    {$where} {$order_by} {$limit}"
            );

            $items = $this->db->resultSet();
            return $items;
        }

        public function appendPartner($items = []) {
            if($items) {
                $this->userModel = model('UserModel');
                foreach($items as $key => $row) {
                    if ($row->is_partner_verified) {
                        $row->partner = $this->userModel->get($row->is_partner_verified, $this->userModel->_public);
                    }
                }
            }
            return $items;
        }

        private function _productTotalStockSQLSnippet() {
            return "SELECT SUM(quantity) as total_stock ,item_id
            FROM stocks 
            GROUP BY item_id";
        }

        public function totalItem() {
            $this->db->query(
                "SELECT count(id) as total_item
                    FROM {$this->table}"
            );
            return $this->db->single()->total_item ?? 0;
        }

        public function getStock($itemId) {
            $this->db->query(
                "SELECT sum(quantity) as total_quantity
                    FROM stocks
                WHERE item_id = '{$itemId}'"
            );
            return $this->db->single()->total_quantity ?? 0;
        }

        public function checkQuantity($itemId, $quantity) {
            $itemStock = $this->getStock($itemId);

            if($itemStock < $quantity) {
                $this->addError("Not enough stock available");
                return false;
            }
            
            return true;
        }

        public function appendImages($products = [], $type = null, $itemId = 'id') {
            foreach($products as $key => $row) {
                $images = $this->getImages($row->$itemId);
                $row->images = $images;
                if($type == 'URL_ONLY') {
                    if($images) {
                        $row->images = arr_layout_keypair($images,'full_url');
                    }
                }else{
                    $row->images = $images;
                }
            }
            return $products;
        }

        public function delete($id) {
            $isOkay = parent::update([
                'is_deleted' => true
            ], $id);

            if($isOkay) {
                $this->addMessage("Item deleted.");
                return true;
            }else{
                $this->addError("Item not found.");
            }
        }

        //conditional function
        public function verify($verifierId, $itemId, $verifierRemarks = 'product verified') {
            $product = parent::get($itemId);
            if(!$product) {
                $this->addError("Product no longer exists");
                return false;
            }

            if($product->is_partner_verified && !is_null($product->is_partner_verified)) {
                $this->addError("This product is already verified, unable to verify");
                return false;
            }

            if($product->is_deleted) {
                $this->addError("This product is already deleted, unable to verify");
                return false;
            }

            return parent::update([
                'is_partner_verified' => $verifierId,
                'verifier_remark' => $verifierRemarks
            ], $itemId);
        }
    }
