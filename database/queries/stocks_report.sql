/*
*get stocks total
*/
SELECT item.* , ifnull(stock.total_stock,0),
    CASE
        WHEN stock.total_stock <= item.min_stock
            THEN 'LOW STOCK LEVEL'
        WHEN stock.total_stock >= item.max_stock
            THEN 'HIGH STOCK LEVEL'
        ELSE 'NORMAL STOCK LEVEL'
    END AS stock_level
FROM items as item
LEFT JOIN (
    SELECT ifnull(sum(quantity),0) as total_stock, item_id
        FROM stocks
        GROUP BY item_id
) as stock
ON stock.item_id = item.id

/*
*HIGH STOCK
*get stocks order by stock max level vs stock total
*/
SELECT item.* , ifnull(stock.total_stock,0),
    (item.max_stock - ifnull(total_stock,0)) as order_total,
    CASE
        WHEN stock.total_stock <= item.min_stock
            THEN 'LOW STOCK LEVEL'
        WHEN stock.total_stock > item.max_stock
            THEN 'HIGH STOCK LEVEL'
        ELSE 'NORMAL STOCK LEVEL'
    END AS stock_level
FROM items as item
LEFT JOIN (
    SELECT ifnull(sum(quantity),0) as total_stock, item_id
        FROM stocks
        GROUP BY item_id
) as stock
ON stock.item_id = item.id
WHERE stock.total_stock > item.max_stock
ORDER BY (ifnull(total_stock,0) - item.max_stock) desc

/*
*highest in quantity
*/
SELECT item.* , ifnull(stock.total_stock,0),
    (item.max_stock - ifnull(total_stock,0)) as order_total,
    CASE
        WHEN stock.total_stock <= item.min_stock
            THEN 'LOW STOCK LEVEL'
        WHEN stock.total_stock > item.max_stock
            THEN 'HIGH STOCK LEVEL'
        ELSE 'NORMAL STOCK LEVEL'
    END AS stock_level
FROM items as item
LEFT JOIN (
    SELECT ifnull(sum(quantity),0) as total_stock, item_id
        FROM stocks
        GROUP BY item_id
) as stock
ON stock.item_id = item.id
GROUP BY item_id
ORDER BY sum(total_stock) desc




