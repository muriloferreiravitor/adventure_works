/*
    This test ensures that the 2011 sales are correct based on the audited accounting value:
    $12,646,112.16
*/

with
    gross_sales_validation as (
        select round(sum(total_gross), 2) as total_gross_2011
        from {{ref ('fct_sales_order')}}
        where extract(year from orderdate) = 2011
    )

select * 
from gross_sales_validation
where total_gross_2011 not between 12646111.16 and 12646113.16