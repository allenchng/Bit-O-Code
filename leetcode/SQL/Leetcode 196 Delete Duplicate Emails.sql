# Use window function to get rank of each email
# filter where rank is 1
# delete results that are not in unique email table

DELETE FROM Person
WHERE Id NOT IN (
    SELECT id
    FROM (
        SELECT email, id,
            RANK() OVER(PARTITION BY email ORDER BY Id ASC) AS id_rank
        FROM Person
    ) AS t1
    WHERE id_rank = 1
);