drop table if exists payments;
create table payments(
    id int(10) not null PRIMARY KEY AUTO_INCREMENT,
    order_id int(10) not null,
    reference varchar(25) not null,
    amount decimal(10,2),
    payment_method enum('CASH','ONLINE') not null,
    mobile_number varchar(100),
    remarks text,
    organization varchar(50),
    account_number varchar(50),
    account_name varchar(100),
    external_reference varchar(50) not null,
    is_removed boolean DEFAULT false,
    created_at timestamp DEFAULT now(),
    created_by int(10)
);



alter table payments
    add column is_approved boolean DEFAULT false;