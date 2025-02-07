with
    source as (
        select *
        from {{ source('sales', 'salesorderheadersalesreason') }}
    )
    
    , sales_order_header_sales_reason as (
        select 
            salesorderid
            , salesreasonid
            , modifieddate
        from source
    )

select *
from sales_order_header_sales_reason
