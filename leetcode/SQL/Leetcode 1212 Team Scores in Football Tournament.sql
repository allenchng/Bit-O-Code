-- cte to get team points hwne host and gues
-- careful, must use union all to catch if a team ties as host and guest
-- join to teams to catch any teams that haven't played yet
-- group by team and aggregate points

WITH points AS (
    SELECT host_team AS team,
        SUM(CASE WHEN host_goals > guest_goals THEN 3
        WHEN host_goals = guest_goals THEN 1
        ELSE 0 END) AS points
    FROM Matches AS m
    GROUP BY host_team

    UNION ALL

    SELECT guest_team AS team,
        SUM(CASE WHEN guest_goals > host_goals THEN 3
           WHEN guest_goals = host_goals THEN 1
           ELSE 0 END) AS points
    FROM Matches AS m
    GROUP BY guest_team
)

SELECT team_id, team_name, SUM(points) AS num_points
FROM (
    SELECT t.team_id, t.team_name, COALESCE(points, 0) AS points
    FROM Teams AS t
    LEFT JOIN points AS p
    ON t.team_id = p.team
) AS t1
GROUP BY team_name
ORDER BY num_points DESC, team_id ASC