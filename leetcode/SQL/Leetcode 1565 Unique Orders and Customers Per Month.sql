-- recast dates to ym
-- filter out orders less than twenty
-- simple group by into count distincts

SELECT month, COUNT(DISTINCT customer_id) AS customer_count, COUNT(DISTINCT order_id) AS order_count
FROM (
    SELECT DATE_FORMAT(order_date, "%Y-%m") AS month, customer_id, invoice, order_id
    FROM Orders
    WHERE invoice > 20
) AS t1
GROUP BY month