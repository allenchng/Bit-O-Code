-- CTE to getall callers / calles into one table
-- split phone numbers to get area code
-- compare country duration to global duration

WITH tmp AS (
    SELECT caller_id AS person, duration
    FROM Calls

    UNION ALL 

    SELECT callee_id AS person, duration
    FROM Calls
)


SELECT c.name AS country
FROM (
    SELECT tmp.person, tmp.duration, 
        SUBSTRING_INDEX(p.phone_number, '-', 1) AS code
    FROM tmp
    INNER JOIN Person AS p
     ON tmp.person = p.id
) As t1
INNER JOIN Country AS c
ON t1.code = c.country_code
GROUP BY c.name
HAVING AVG(t1.duration) > (
    SELECT AVG(duration)
    FROM Calls
)