-- straightforward inner join into group by aggregation

select p.name
    , sum(rest) as rest
    , sum(paid) as paid
    , sum(canceled) as canceled
    , sum(refunded) as refunded
from Product as p
inner join Invoice as i
    on p.product_id = i.product_id
group by 1
order by 1 asc