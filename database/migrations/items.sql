DROP TABLE IF EXISTS items;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `barcode` varchar(255) NOT NULL,
  `cost_price` varchar(255) NOT NULL,
  `sell_price` varchar(255) NOT NULL,
  `min_stock` int(10) DEFAULT NULL,
  `max_stock` int(10) DEFAULT NULL,
  `category_id` int,
  `variant` varchar(100),
  `remarks` text NOT NULL,
  `is_visible` int(11) NOT NULL,
  `is_partner_verified` int(11) DEFAULT NULL,
  `created_at` timestamp DEFAULT now(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8
