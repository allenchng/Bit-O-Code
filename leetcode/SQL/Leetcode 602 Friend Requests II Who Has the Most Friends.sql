# reverse fields to get all id's on one side
# union the results
# group by id, count the number of distinct friends you have

SELECT id, COUNT(DISTINCT friend) AS num
FROM (
    SELECT requester_id AS id, accepter_id AS friend
    FROM request_accepted

    UNION 

    SELECT accepter_id AS id, requester_id AS friend
    FROM request_accepted
) AS t1
GROUP BY 1
ORDER BY num DESC
LIMIT 1;
