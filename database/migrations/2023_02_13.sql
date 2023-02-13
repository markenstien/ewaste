drop table if exists taxes;
create table taxes(
    id int(10) not null primary key auto_increment,
    tax_percentage int(10),
    is_active boolean default true,
    updated_at timestamp default now(),
    created_at timestamp default now()
);


alter table orders 
add column tax_amount decimal(10,2),
add column tax_percentage int(10);


alter table items 
add column commission_amount decimal(10,2);


alter table users 
    add column is_term_accepted boolean default false;



CREATE VIEW as v_total_sold_quantity SELECT item_id, count(quantity) as total_sold_quantity
    FROM order_items
    GROUP BY item_id
    ORDER BY count(quantity) desc;



CREATE VIEW v_total_sold_amount as SELECT item_id, sum(amount) as total_sold_amount
    FROM order_items
    GROUP BY item_id;