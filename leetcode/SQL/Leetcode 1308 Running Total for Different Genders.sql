# window function over gender, order by day

SELECT gender, day,
    SUM(score_points) OVER(PARTITION BY gender ORDER BY day ASC) AS total
FROM scores