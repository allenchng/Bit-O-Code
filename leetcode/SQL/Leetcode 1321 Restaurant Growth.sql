# collapse rows across day
# window function using preceeding
# only calculate MA starting on row 7 or more
# use mysql frames to calculate
# subquery to filter out null values

SELECT visited_on, amount, average_amount
FROM (
    SELECT visited_on,
        CASE WHEN ROW_NUMBER() OVER(ORDER BY visited_on) >= 7 THEN
            SUM(amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
            ELSE NULL END AS amount,
        ROUND(CASE WHEN ROW_NUMBER() OVER(ORDER BY visited_on) >= 7 THEN
            AVG(amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
            ELSE NULL END, 2) AS average_amount
    FROM (
        SELECT visited_on, SUM(amount) AS amount
        FROM Customer
        GROUP BY visited_on
    ) AS t1
) AS t2
WHERE amount IS NOT NULL;