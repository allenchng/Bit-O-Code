# extract year from orders
# group by buyer_id to count number of orders
# join with users table

# coalesce 

WITH year_orders AS (
    SELECT buyer_id, COUNT(DISTINCT order_id) AS orders_in_2019
    FROM (
        SELECT order_id, EXTRACT(YEAR FROM order_date) AS year, buyer_id
        FROM Orders
    ) AS t1
    WHERE year = 2019
    GROUP BY buyer_id
)

SELECT u.user_id AS buyer_id, u.join_date, COALESCE(orders_in_2019, 0) AS orders_in_2019
FROM Users AS u
LEFT JOIN year_orders AS y
ON u.user_id = y.buyer_id