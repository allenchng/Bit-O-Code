-- running total - think window function
-- range between is mysql specific 

SELECT player_id, event_date,
    SUM(games_played) OVER(PARTITION BY player_id ORDER BY event_date RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS games_played_so_far
FROM Activity