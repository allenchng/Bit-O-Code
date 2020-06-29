-- window function
-- use row number to identify gaps in consecutive numbers
-- use group by to identify the mins and maxes of each partition

SELECT MIN(log_id) AS start_id, MAX(log_id) AS end_id
FROM (
    SELECT log_id,
        log_id - ROW_NUMBER() OVER(ORDER BY log_id ASC) AS log_partition
    FROM Logs
) AS t1
GROUP BY log_partition