# id | name

# distinct login dates (since can login multiple times)
# eslf join where dates must be between current and 4 days in past
# count if there's 4 distinct dates to ensure "consecutive"

SELECT t1.id, A.name
FROM(
    SELECT DISTINCT l1.id
    FROM Logins AS l1
    INNER JOIN Logins AS l2
    ON (l1.id = l2.id) AND DATEDIFF(l1.login_date, l2.login_date) BETWEEN 1 AND 4
    GROUP BY l1.id, l1.login_date
    HAVING COUNT(DISTINCT l2.login_date) = 4
) AS t1
INNER JOIN Accounts AS A
ON t1.id = A.id
ORDER BY t1.id ASC;