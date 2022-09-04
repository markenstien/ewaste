DROP TABLE IF EXISTS categories;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category` varchar(50) NOT NULL COMMENT 'product or common_transactions',
  `active` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;



INSERT INTO categories(
  name, category, active 
)

VALUES('STRETCHERS','ITEMS',1),
('SURGICAL TABLES','ITEMS',1),
('DEFIBRILLATORS','ITEMS',1);