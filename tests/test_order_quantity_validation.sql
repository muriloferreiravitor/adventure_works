/*
    This test is used to verify the consistency of the quantity of orders over time.
    The quantity of orders from 2011-05-31 to 2014-06-30 is 31,465.
*/

with
    order_quantity_validation as (
        select
            count(distinct salesorderid) as order_quantity
        from {{ref ('fct_sales_order')}}
        where orderdate between '2011-05-31' and '2014-06-30'

    )

select * 
from order_quantity_validation
where order_quantity != 31465