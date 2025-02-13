/*  TODO: ATUALIZAR

    Este teste garante que as vendas de 2012 estão
    corretas com o valor auditado da contabilidade:
    R$ 226298.5
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