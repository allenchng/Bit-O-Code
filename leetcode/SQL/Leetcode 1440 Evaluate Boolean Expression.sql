-- two joins
-- v1.value / v2.value

WITH t1 AS (
    SELECT e.left_operand, v1.value AS left_value, e.operator, e.right_operand, v2.value AS right_value
    From Expressions AS e
    LEFT JOIN Variables AS v1
    ON e.left_operand = v1.name
    LEFT JOIN Variables AS v2
    ON e.right_operand = v2.name
)

SELECT left_operand, operator, right_operand, 
    CASE WHEN left_value > right_value AND operator = ">" THEN "true"
    WHEN left_value < right_value AND operator = "<" THEN "true"
    WHEN left_value = right_value AND operator = "=" THEN "true"
    ELSE "false" END AS value
FROM t1