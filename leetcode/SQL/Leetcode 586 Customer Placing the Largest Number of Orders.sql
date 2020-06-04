# customer_number

# using CTE

WITH cust_order AS (
    SELECT customer_number, COUNT(order_number) AS num_orders
    FROM orders
    GROUP BY customer_number
    ORDER BY num_orders DESC
)

SELECT customer_number
FROM cust_order
LIMIT 1;

# using subquery

SELECT customer_number 
FROM orders
GROUP BY customer_number
HAVING COUNT(DISTINCT order_number) IN (
    SELECT MAX(num_orders) 
    FROM (SELECT COUNT(DISTINCT order_number) AS num_orders 
          FROM orders 
          GROUP BY customer_number) AS t1)