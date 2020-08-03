-- filter for june and july
-- aggregate total order price for each month
-- join to get names, aggregate and filter for people that ordered in BOTH months

WITH customer_totals AS (
    SELECT customer_id, ym, SUM(cost) AS total
    FROM (
        SELECT o.order_id, DATE_FORMAT(o.order_date, "%Y-%m") AS ym, o.customer_id,
            p.price * o.quantity AS cost
        FROM Orders AS o
        INNER JOIN Product AS p
        ON o.product_id = p.product_id
        WHERE DATE_FORMAT(o.order_date, "%Y-%m") = "2020-06"
            OR DATE_FORMAT(o.order_date, "%Y-%m") = "2020-07"
    ) AS t1
    GROUP BY customer_id, ym
)

SELECT c1.customer_id, c2.name
FROM customer_totals AS c1
JOIN Customers AS c2
ON c1.customer_id = c2.customer_id
GROUP BY c1.customer_id
HAVING SUM(CASE WHEN c1.total >= 100 THEN 1 ELSE 0 END) = 2
