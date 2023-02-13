/*
*order status
*/
ENUM('pending', 'for-delivery', 'cancelled', 'complete', 'returned')



alter table orders 
    add column reason_id int(10);