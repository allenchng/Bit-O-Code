
SELECT DISTINCT t1.id,
    CASE WHEN t1.p_id IS NULL THEN "Root"
    WHEN t1.p_id IS NOT NULL AND t2.id IS NOT NULL THEN "Inner"
    ELSE "Leaf" END AS Type
FROM tree AS t1
LEFT JOIN tree AS t2
ON t1.id = t2.p_id
ORDER BY id ASC