-- window function over users and get first login
-- group by dates to get num first logins
-- filter for activity dates between 90 days

SELECT activity_date AS login_date, COUNT(DISTINCT user_id) AS user_count
FROM (
    SELECT user_id, activity_date,
        RANK() OVER(PARTITION BY user_id ORDER BY activity_date) AS login_rank
    FROM Traffic
    WHERE activity = "login"
) AS t2
WHERE login_rank = 1 AND activity_date BETWEEN ("2019-06-30" - INTERVAL 90 DAY) AND "2019-06-30"
GROUP BY activity_date