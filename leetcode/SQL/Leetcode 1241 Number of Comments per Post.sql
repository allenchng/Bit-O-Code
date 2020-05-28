# post_id | number_of_comments

# get unique comments per post
# self join (inner to get just get parents)
# group by sub_id, count sub_id from second table

SELECT s1.sub_id AS post_id, COUNT(DISTINCT s2.sub_id) AS number_of_comments
FROM Submissions AS s1
LEFT JOIN Submissions AS s2
ON s1.sub_id = s2.parent_id
WHERE s1.parent_id IS NULL
GROUP BY s1.sub_id