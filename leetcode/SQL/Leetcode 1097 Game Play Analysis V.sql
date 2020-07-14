-- window function to partition by player
-- order by logins, shift next login up
-- filter for first login
-- players with no second login will have null diff

WITH login AS(
    SELECT player_id, event_date,
        RANK() OVER(PARTITION BY player_id ORDER BY event_date ASC) AS login_order,
        LEAD(event_date) OVER(PARTITION BY player_id ORDER BY event_date ASC) AS next_date
    FROM Activity
)

SELECT event_date AS install_dt,
       COUNT(DISTINCT player_id) AS installs,
        ROUND(SUM(CASE 
                      WHEN next_date = DATE_ADD(event_date, INTERVAL 1 DAY) THEN 1 
                      ELSE 0 
                  END)*1.0/COUNT(DISTINCT player_id), 2) AS Day1_retention
FROM login
WHERE login_order = 1
GROUP BY event_date
