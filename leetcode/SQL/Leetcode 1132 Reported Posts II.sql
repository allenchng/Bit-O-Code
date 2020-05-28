# filter for days with reported posts
# join removals to see if they were removed
# if removed, will have post_id
# group by and calculate percentage

SELECT ROUND(AVG(perc_remove) * 100.0, 2) AS average_daily_percent
FROM (
    SELECT action_date,
        COUNT(DISTINCT r.post_id) / COUNT(DISTINCT a.post_id) AS perc_remove
    FROM Actions AS a
    LEFT JOIN Removals AS r
    ON a.post_id = r.post_id
    WHERE extra = "spam"
    GROUP BY action_date
) AS t1