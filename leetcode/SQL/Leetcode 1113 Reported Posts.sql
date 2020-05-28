# filter by action = report
# filter by posts from yesterday
# group by extra, get count
# make sure to count distinct posts


SELECT extra AS report_reason, COUNT(DISTINCT post_id) AS report_count
FROM Actions
WHERE action = "report" AND action_date = DATE_SUB("2019-07-05", INTERVAL 1 DAY)
GROUP BY extra
