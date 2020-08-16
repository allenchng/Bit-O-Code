-- simple rank order, could also use first_value

SELECT product_name, product_id, order_id, order_date
FROM (
    SELECT p.product_name, p.product_id, o.order_id, o.order_date,
        RANK() OVER(PARTITION BY p.product_name ORDER BY o.order_date DESC) AS rank_order
    FROM Products AS p
    INNER JOIN Orders AS o
    ON p.product_id = o.product_id
) AS t1
WHERE rank_order = 1
ORDER BY product_name ASC, product_id ASC, order_id ASC