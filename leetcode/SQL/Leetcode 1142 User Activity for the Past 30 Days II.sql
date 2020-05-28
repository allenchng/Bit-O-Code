# user | avg_sessions

# filter for last 30 days
# group by user
# get number of unique sessions
# get avg sessions

# num sessions / num users

SELECT ROUND(AVG(num_session), 2)
FROM (
    SELECT user_id, COUNT(DISTINCT session_id) AS num_session
    FROM Activity
    WHERE (activity_date BETWEEN DATE_SUB("2019-07-27", INTERVAL 29 DAY) AND "2019-07-27")
    GROUP BY user_id
) AS t1

