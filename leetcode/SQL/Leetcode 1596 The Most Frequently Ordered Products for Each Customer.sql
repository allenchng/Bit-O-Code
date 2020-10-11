-- window function to get rank of product for customer_id

select t2.customer_id, t2.product_id, p.product_name
from (
    select customer_id, product_id,
        rank() over(partition by customer_id order by num desc) as prod_rank
    from (
        select o.customer_id, o.product_id, c.name, count(*) AS num
        from Orders as o
        left join Customers as c
            on o.customer_id = c.customer_id
        group by 1, 2
    ) as t1
) as t2
inner join Products as p
on t2.product_id = p.product_id
where t2.prod_rank = 1
order by 1 asc, 2 asc