-- CTE to get table with individual credit changes by user_amount
-- not all users will have transactions, coalesce nulls to 0
-- case when to find negative balances

WITH trans_amounts AS (
    SELECT paid_by as user_id, amount * -1 AS amount
    FROM Transactions

    UNION ALL

    SELECT paid_to AS user_amount, amount
    FROM Transactions
)

SELECT user_id, user_name, credit,
    CASE WHEN credit < 0 THEN 'Yes' ELSE 'No' END AS credit_limit_breached
FROM (
    SELECT u.user_id, u.user_name, u.credit + COALESCE(trans_total, 0) AS credit
    FROM Users AS u
    LEFT JOIN (
        SELECT user_id, SUM(amount) AS trans_total
        FROM trans_amounts
        GROUP BY user_id
    ) AS t1 
    ON u.user_id = t1.user_id
) AS t2