-- self join based on viewer_id, view_date, article_id not being the same
-- author id and viewer id are the same person


SELECT DISTINCT v1.viewer_id as id
FROM Views as v1
JOIN Views AS v2
ON (v1.viewer_id = v2.viewer_id) 
AND (v1.view_date = v2.view_date) 
AND (v1.article_id != v2.article_id)
ORDER BY 1


-- this problem can actually be solved faster using a simple group BY

SELECT DISTINCT viewer_id AS id
FROM Views
GROUP BY viewer_id, view_date
HAVING COUNT(DISTINCT article_id) > 1