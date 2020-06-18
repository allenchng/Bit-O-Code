
# make new field for money spent or gained
# if buy, spent. else gained
# group by stock name and sum up money


SELECT stock_name,
    SUM(CASE WHEN operation = "Buy" THEN price * -1 ELSE price END) AS capital_gain_loss
FROM Stocks
GROUP BY stock_name;