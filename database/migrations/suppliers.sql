DROP TABLE IF EXISTS suppliers;
CREATE TABLE `suppliers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `product` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `status` enum('terminated','active') DEFAULT 'active',
  `date_start` date DEFAULT NULL,
  `contact_person_name` varchar(100) DEFAULT NULL,
  `contact_person_number` varchar(100) DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp DEFAULT now() ON UPDATE now(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4