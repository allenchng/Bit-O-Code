# get friends of user = 1
# be careful because can be a friend in user2_id
# use to filter likes table 
# also filter out pages user 1 has liked already

# recommended_page

SELECT DISTINCT page_id AS recommended_page
FROM Likes
WHERE user_id IN (
    SELECT user1_id
    FROM Friendship
    WHERE user2_id = 1

    UNION

    SELECT user2_id
    FROM Friendship
    WHERE user1_id = 1
)
AND page_id NOT IN (
    SELECT page_id
    FROM Likes
    WHERE user_id = 1);