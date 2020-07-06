-- simple join into aggregation
-- consider using window function if want a filtering method of getting first rank

SELECT name
FROM (
    SELECT c.name, COUNT(*) AS votes
    FROM Candidate AS c
    LEFT JOIN Vote AS v
    ON c.id = v.CandidateID
    GROUP BY c.name
) AS t1
ORDER BY votes DESC
LIMIT 1