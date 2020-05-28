# How I think the query should be 

SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date <= "2019-07-27" 
AND activity_date > DATE_SUB("2019-07-27", INTERVAL 30 DAY)
AND activity_type IN ("scroll_down", "send_message")
GROUP BY activity_date;

# What leetcode accepts

SELECT COUNT(distinct user_id) as active_users, activity_date as day
from Activity
WHERE activity_date <= '2019-07-27' AND activity_date > '2019-06-27'
AND (activity_type !='open_session' OR activity_type!='end_session')
GROUP BY activity_date