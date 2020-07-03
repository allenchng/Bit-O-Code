# collapse rows across day
# window function using preceeding
# only calculate MA starting on row 7 or more
# use mysql frames to calculate
# subquery to filter out null values

SELECT visited_on, amount, ROUND(average_amount, 2) AS average_amount
FROM (
    SELECT visited_on, amount, average_amount,
        ROW_NUMBER() OVER(ORDER BY visited_on ASC) AS day_num
    FROM (
        SELECT visited_on,
            SUM(daily_amount) OVER(ORDER BY visited_on ASC ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
            AVG(daily_amount) OVER(ORDER BY visited_ON ASC ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS average_amount
        FROM (
            SELECT visited_on, SUM(amount) AS daily_amount
            FROM Customer
            GROUP BY visited_on
        ) AS t1
    ) AS t2
) AS t3
WHERE day_num > 6