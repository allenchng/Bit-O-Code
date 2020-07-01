-- window function to get cumulative weight
-- subtract 1000? min value that is still negative or 0

SELECT person_name
FROM (
    SELECT person_name, SUM(weight) OVER(ORDER BY turn) AS run_total
    FROM Queue
) AS t1
WHERE run_total <= 1000
ORDER BY run_total DESC
LIMIT 1;

