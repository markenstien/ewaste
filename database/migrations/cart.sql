create table carts(
    id int(10) not null primary key auto_increment,
    user_id int(10) not null,
    created_at timestamp default now()
);


create table cart_items(
    id int(10) not null primary key auto_increment,
    cart_id int(10),
    item_id int(10),
    quantity int(10),
    date_created datetime default null
);