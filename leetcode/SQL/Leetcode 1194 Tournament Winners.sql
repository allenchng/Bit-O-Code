-- count points for first and second players separately
-- union all because to count points from ties
-- rank to get top player in each category
-- filter

WITH t1 AS (
    SELECT *
    FROM Matches AS m
    LEFT JOIN Players AS p
    ON m.first_player = p.player_id
)

SELECT group_id, player AS player_id
FROM (
    SELECT group_id, player, 
        RANK() OVER(PARTITION BY group_id ORDER BY score DESC, player ASC) AS group_rank
    FROM (
        SELECT group_id, player, SUM(total_score) AS score
        FROM (
            SELECT group_id, first_player AS player, SUM(first_score) AS total_score
            FROM t1
            GROUP BY group_id, first_player

            UNION ALL

            SELECT group_id, second_player AS player, SUM(second_score) As total_score
            FROM t1
            GROUP BY group_id, second_player
        ) AS t2
        GROUP BY group_id, player
    ) AS t3
) AS t4
WHERE group_Rank = 1