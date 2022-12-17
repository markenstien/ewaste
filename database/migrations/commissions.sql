create table commissions(
    id int(10) not null primary key auto_increment,
    user_id int(10) not null,
    amount decimal(10,2),
    order_id int(10),
    status enum('released','active','cancelled'),
    release_date datetime,
    updated_at timestamp default now() ON UPDATE now(),
    created_at timestamp default now()
);