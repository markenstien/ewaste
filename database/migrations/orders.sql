DROP TABLE IF EXISTS orders;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` text NOT NULL,
  `reference` varchar(50) NOT NULL,
  `customer_name` varchar(100),
  `address` varchar(255),
  `mobile_number` varchar(50),
  `email` varchar(100),
  `date_time` varchar(255),
  `gross_amount` varchar(255),
  `net_amount` varchar(255),
  `discount_amount` varchar(255),
  `is_paid` int(11),
  `remarks` text DEFAULT NULL,
  `staff_id` int(10),
  `order_status` enum('completed','cancelled','ongoing') DEFAULT 'ongoing',
  `created_at` timestamp DEFAULT now(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8


DROP TABLE IF EXISTS orders;
CREATE TABLE orders(
  id int(10) not null primary key AUTO_INCREMENT,
  reference varchar(50),
  seller_id int(10) not null,
  customer_id int(10) not null,
  gross_amount decimal(10,2),
  net_amount decimal(10,2),
  discount decimal(10,2),
  status enum('pending','cancelled','complete'),
  is_delivered boolean DEFAULT false,
  is_paid boolean DEFAULT false,
  remarks text,
  created_at timestamp DEFAULT now(),
  updated_at timestamp DEFAULT now() on UPDATE CURRENT_TIMESTAMP
);

