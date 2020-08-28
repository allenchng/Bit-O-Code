-- order the dates, take ranks under 4

SELECT name AS customer_name, customer_id, order_id, order_date
FROM (
    SELECT c.name, c.customer_id, o.order_id, o.order_date,
        RANK() OVER(PARTITION BY c.customer_id ORDER BY order_date DESC) AS rank_order
    FROM Customers AS c
    INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id
) AS t1
WHERE rank_order < 4
ORDER BY customer_name ASC, customer_id ASC, order_date DESC