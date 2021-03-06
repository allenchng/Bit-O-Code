# self join
# followee = follower
# count follower 2

# followee | follower | followee | follower
# use inner join to only get follower's with matches
# get distinct follower

SELECT f1.follower, COUNT(DISTINCT f2.follower) AS num
FROM follow AS f1
INNER JOIN follow AS f2
ON f1.follower = f2.followee
GROUP BY f1.follower;