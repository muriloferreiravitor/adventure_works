/*  TODO: ATUALIZAR

    Este teste garante que as vendas de 2011 estão
    corretas com o valor auditado da contabilidade:
    R$ 12646112.16
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