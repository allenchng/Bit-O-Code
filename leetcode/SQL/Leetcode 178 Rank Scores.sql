# cant use rank function because it 'skips' values
# find values greater than or equal to current
# subquery for list of unique values
# join back to scores on scores that are >= left side
# group by id and score and count

SELECT Score, num 
FROM (
    SELECT s.Id, s.Score, COUNT(DISTINCT t1.Score) AS num
    FROM Scores AS s
    LEFT JOIN (
        SELECT DISTINCT Score
        FROM Scores
        ORDER BY Score DESC
    ) AS t1
    ON s.Score <= t1.Score
    GROUP BY Id, s.Score
) AS ranks
ORDER BY Score DESC