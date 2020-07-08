-- first login is going to be min date
-- window function to get ranks
-- window function to get lead (next day) and subtract current date
-- filter for first rank, 
-- if difference between first and second login is 1, then mark as consecutive, otherwise 0

SELECT ROUND(AVG(CASE WHEN day_diff = 1 THEN 1 ELSE 0 END), 2) AS fraction
FROM (
    SELECT player_id, event_date,
        RANK() OVER(PARTITION BY player_id ORDER BY event_date ASC) AS login_rank,
        IFNULL(LEAD(event_date) OVER(PARTITION BY player_id ORDER BY event_date ASC) - event_date, 0) AS day_diff
    FROM Activity
) AS t1
WHERE login_rank = 1