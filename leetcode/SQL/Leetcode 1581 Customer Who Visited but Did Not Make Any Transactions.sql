select customer_id, count(*) as count_no_trans
from (
    select v.visit_id, v.customer_id, coalesce(t.transaction_id, 'na') as transaction_id
    from Visits as v
    left join Transactions as t
    on v.visit_id = t.visit_id
) as t1
where transaction_id = "na"
group by customer_id