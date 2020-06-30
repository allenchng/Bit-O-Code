-- invoice_id | customer_name | price | contacts_cnt | trusted_contacts_cnt

-- customer_name, contacts_ cnt, trusted_contacts
-- trusted contacts are emails in customers table

SELECT invoice_id, c.customer_name, price, CASE WHEN contacts_cnt IS NULL THEN 0 ELSE contacts_cnt END AS contacts_cnt, CASE WHEN trusted_contacts_cnt IS NULL THEN 0 ELSE trusted_contacts_cnt END AS trusted_contacts_cnt
FROM Invoices AS i
LEFT JOIN (
    SELECT user_id,
        COUNT(DISTINCT contact_email) AS contacts_cnt,
        SUM(CASE WHEN contact_email IN (SELECT DISTINCT email FROM Customers) THEN 1 ELSE 0 END) AS trusted_contacts_cnt
    FROM Contacts
    GROUP BY user_id
) AS t1
ON i.user_id = t1.user_id
LEFT JOIN Customers AS c
ON i.user_id = c.customer_id
ORDER BY invoice_id ASC


-- ugly alternative, but at least I get to use COALESCE functions

WITH customer_relations AS (
    SELECT t1.user_id, t1.contacts_cnt, t2.trusted_contacts_cnt
    FROM (
        SELECT user_id, COUNT(DISTINCT contact_name) AS contacts_cnt
        FROM Contacts
        GROUP BY user_id
    ) AS t1
    LEFT JOIN (
        SELECT user_id,
            SUM(CASE WHEN contact_email IN (SELECT email FROM Customers) THEN 1 ELSE 0 END) AS trusted_contacts_cnt
        FROM Contacts
        GROUP BY user_id
    ) as t2
    ON t1.user_id = t2.user_id
)

SELECT i.invoice_id, c2.customer_name, i.price, COALESCE(c1.contacts_cnt, 0) AS contacts_cnt, COALESCE(trusted_contacts_cnt, 0) AS trusted_contacts_cnt
FROM Invoices AS i
LEFT JOIN customer_relations AS c1
ON i.user_id = c1.user_id
LEFT JOIN Customers AS c2
ON i.user_id = c2.customer_id
ORDER BY invoice_id