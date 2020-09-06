-- inner join and then get total volume per product
-- group by warehouse to get total

SELECT warehouse_name, SUM(volume) AS volume
FROM (
    SELECT name AS warehouse_name, p.Width * p.Length * p.Height * w.units AS volume
    FROM Warehouse AS w
    INNER JOIN Products AS p
        ON w.product_id = p.product_id
) AS t1
GROUP BY warehouse_name