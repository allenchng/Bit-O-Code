
# num accept / num requests
# overall_accept

# cross join to return all combinations
# count the distinct requests / distinct accepts


# 1 | 2 | 2016_06-01 |1 | 2 | 2016_06-03

SELECT ROUND(IFNULL(COUNT(DISTINCT requester_id, accepter_id) / COUNT(DISTINCT sender_id, send_to_id), 0), 2) AS accept_rate
FROM friend_request
CROSS JOIN request_accepted