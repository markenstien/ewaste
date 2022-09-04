DROP TABLE IF EXISTS petty_cash;
create table petty_cash(
    id int(10) not null PRIMARY KEY AUTO_INCREMENT,
    reference varchar(50),
    user_id int(10) not null,
    amount decimal(10,2),
    entry_type enum('ADD','DEDUCT'),
    category_id int(10),
    remarks text,
    date date,
    created_at timestamp DEFAULT now(),
    created_by int(10)
);