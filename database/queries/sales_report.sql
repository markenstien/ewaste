    SELECT item.name as item_name,
    item.sku as sku, oi.*, ordr.reference, ordr.created_at

    FROM items as item
    LEFT JOIN order_items as oi
    ON oi.item_id = item.id 

    LEFT JOIN orders as ordr 
    ON oi.order_id = ordr.id

    WHERE ordr.is_paid = true




    /*
    *most seeling items
    */

    SELECT SUM(quantity), item.name as item_name 
        FROM order_items as oi 
        LEFT JOIN items as item
        ON oi.item_id = item.id 

        ORDER BY SUM(quantity) desc
        GROUP BY item.id 


    /*
    *LEAST SELLING
    */

    SELECT SUM(quantity), item.name as item_name 
        FROM order_items as oi 
        LEFT JOIN items as item
        ON oi.item_id = item.id 

        ORDER BY SUM(quantity) asc
        GROUP BY item.id


        /*
    *most seeling items
    */

    SELECT SUM(sold_price), item.name as item_name 
        FROM order_items as oi 
        LEFT JOIN items as item
        ON oi.item_id = item.id 

        ORDER BY SUM(sold_price) desc
        GROUP BY item.id 


    /*
    *LEAST SELLING
    */

    SELECT SUM(sold_price), item.name as item_name 
        FROM order_items as oi 
        LEFT JOIN items as item
        ON oi.item_id = item.id 

        ORDER BY SUM(sold_price) asc
        GROUP BY item.id 

