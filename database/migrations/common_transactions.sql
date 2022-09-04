DROP TABLE IF EXISTS common_transactions;
create table common_transactions(
    id int(10) not null PRIMARY KEY AUTO_INCREMENT,
    category_id int(10) not null,
    amount decimal(10,2),
    entry_type enum('DEDUCT','ADD'),
    remarks text,
    created_by int(10),
    created_at timestamp DEFAULT now() ON UPDATE now()
);