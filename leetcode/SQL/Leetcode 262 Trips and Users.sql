# find un-banned users
# inner join to get unbanned clients
# inner join to get unbanned drivers
# filter for dates
# case whens to get ratio


SELECT Request_at AS Day,
    ROUND(SUM(cancelled_trip) / COUNT(1), 2) AS "Cancellation Rate"
FROM (
    SELECT t1.Request_at,
        CASE WHEN Status LIKE "cancelled%" THEN 1 ELSE 0 END AS cancelled_trip
    FROM Users AS u
    INNER JOIN Trips AS t1
    ON u.Users_Id = t1.Client_Id
    INNER JOIN Users AS u2
    ON u2.Users_Id = t1.Driver_id
    WHERE u.Banned = "No"
    AND t1.Request_at BETWEEN "2013-10-01" AND "2013-10-03"
) AS sub
GROUP BY Request_at