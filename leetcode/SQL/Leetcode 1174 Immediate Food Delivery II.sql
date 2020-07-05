-- case when to encode immediate as 1 and scheduled as 0
-- Window function to get first order
-- average to get immediate percentage

SELECT ROUND(AVG(order_type) * 100.0, 2) AS immediate_percentage
FROM (
    SELECT delivery_id, customer_id, order_date, order_type,
        RANK() OVER(PARTITION BY customer_id ORDER BY order_date ASC) AS order_rank
    FROM (
        SELECT delivery_id, customer_id, order_date, 
            CASE WHEN order_date = customer_pref_delivery_date THEN 1
            ELSE 0 END AS order_type
        FROM Delivery
    ) AS t1
) AS t2
WHERE order_rank = 1