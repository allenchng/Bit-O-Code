-- window function to add field with averages
-- group by to find 2 or more events per business

SELECT business_id
FROM (
    SELECT business_id,
        CASE WHEN occurences > avg_occ THEN 1 ELSE 0 END AS active
    FROM (
        SELECT business_id, event_type, occurences,
            AVG(occurences) OVER(PARTITION BY event_type) AS avg_occ
        FROM Events
    ) AS t1
) AS t2
GROUP BY business_id
HAVING SUM(active) > 1