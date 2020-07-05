
# team_id | team_name | num_points
# win = 3, tie = 1, loss = 0

# join match to team 
# create new field for points
# aggregate points for each team

SELECT team_id, team_name,
    SUM(CASE WHEN team_id = host_team AND host_goals > guest_goals THEN 3 ELSE 0 END) +
    SUM(CASE WHEN team_id = guest_team AND guest_goals > host_goals THEN 3 ELSE 0 END) +
    SUM(CASE WHEN team_id = host_team AND host_goals = guest_goals THEN 1 ELSE 0 END) +
    SUM(CASE WHEN team_id = guest_team AND host_goals = guest_goals THEN 1 ELSE 0 END) AS num_points
FROM Teams AS t
LEFT JOIN Matches AS m
ON t.team_id = m.host_team OR t.team_id = m.guest_team
GROUP BY 1, 2
ORDER BY 3 DESC, 1 ASC;