# Null return value makes this problem trickier
# subquery to find max salary
# filter where value is less than max salary
# select new max

SELECT MAX(Salary) AS SecondHighestSalary
FROM Employee
WHERE Salary < (
    SELECT MAX(Salary)
    FROM Employee
);