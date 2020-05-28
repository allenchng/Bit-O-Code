# self join the orders table
# customer_id where product_name is not same
# twice?
# group by customer

SELECT t2.customer_id, customer_name
FROM (
    SELECT customer_id,
        CASE WHEN product_name IN ("A","B") THEN 1 ELSE 0 END AS num
    FROM (
        SELECT *
        FROM Orders
        WHERE customer_id NOT IN (
            SELECT customer_id
            FROM Orders
            WHERE product_name = "C"
        )
    ) AS t1
    GROUP BY customer_id
    HAVING SUM(num) = 2
) AS t2
INNER JOIN Customers AS c
ON t2.customer_id = c.customer_id;
