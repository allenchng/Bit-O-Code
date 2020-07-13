-- Join to items table to avoid missing categories
-- aggregate across category
-- "pivot" using case when to get named dates as columns

SELECT item_category AS CATEGORY,
    SUM(CASE WHEN named_day = "Monday" THEN quantity ELSE 0 END) AS "MONDAY",
    SUM(CASE WHEN named_day = "Tuesday" THEN quantity ELSE 0 END) AS "TUESDAY",
    SUM(CASE WHEN named_day = "Wednesday" THEN quantity ELSE 0 END) AS "WEDNESDAY",
    SUM(CASE WHEN named_day = "Thursday" THEN quantity ELSE 0 END) AS "THURSDAY",
    SUM(CASE WHEN named_day = "Friday" THEN quantity ELSE 0 END) AS "FRIDAY",
    SUM(CASE WHEN named_day = "Saturday" THEN quantity ELSE 0 END) AS "SATURDAY",
    SUM(CASE WHEN named_day = "Sunday" THEN quantity ELSE 0 END) AS "SUNDAY"
FROM (
    SELECT i.item_category, DAYNAME(o.order_date) AS named_day, quantity
    FROM Items AS i
    LEFT JOIN Orders AS o
    ON o.item_id = i.item_id
) AS t1
GROUP BY item_category
ORDER BY 1 ASC