# bunch of unions
# odd students id + 1
# even students id - 1
# final row 

SELECT * 
FROM (
    SELECT s1.id - 1 AS id, s1.student
    FROM seat AS s1
    WHERE id MOD 2 = 0

    UNION

    SELECT s2.id + 1 AS id, s2.student
    FROM seat AS s2
    WHERE id MOD 2 = 1 AND id != (
        SELECT MAX(id)
        FROM seat
    )

    UNION

    SELECT s3.id AS id, s3.student
    FROM seat AS s3
    WHERE id MOD 2 = 1. AND id = (
        SELECT MAX(id)
        FROM seat
    ) 
) AS s1
ORDER BY id ASC
