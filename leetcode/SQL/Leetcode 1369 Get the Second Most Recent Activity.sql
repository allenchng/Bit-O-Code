# rank window function to get activity per user
# filter where act rank is equal to 2
# union with users that only have 1 activity row

# user | activity

SELECT username, activity, startDate, endDate
FROM UserActivity
GROUP BY username
HAVING COUNT(*) = 1

UNION

SELECT username, activity, startDate, endDate
FROM (
    SELECT username, activity, startDate, endDate,
        RANK() OVER(PARTITION BY username ORDER BY endDate DESC) AS act_rank
    FROM UserActivity
) AS s1
WHERE act_rank = 2;