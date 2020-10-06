-- simple join into aggregation

select u.name, sum(amount) AS balance
from Transactions as t
inner join Users as u
  on t.account = u.account
group by t.account
having sum(amount) > 10000;