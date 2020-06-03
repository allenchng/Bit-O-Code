# make field with approved / not approved
# two separate tables that are unioned

SELECT month, country,
    SUM(CASE WHEN state = "approved" THEN 1 ELSE 0 END) AS approved_count,
    SUM(CASE WHEN state = "approved" THEN amount ELSE 0 END) AS approved_amount,
    SUM(CASE WHEN state = "chargeback" THEN 1 ELSE 0 END) AS chargeback_count,
    SUM(CASE WHEN state = "chargeback" THEN amount ELSE 0 END) AS chargeback_amount
FROM (
    SELECT DATE_FORMAT(c.trans_date, "%Y-%m") AS month, t.country, t.amount, "chargeback" AS state
    FROM Transactions AS t
    INNER JOIN Chargebacks AS c
    ON t.id = c.trans_id

    UNION ALL

    SELECT DATE_FORMAT(trans_date, "%M %Y") AS month, country, amount, "approved" AS state
    FROM Transactions
    WHERE state = "approved"
) AS t1
GROUP BY 1, 2;