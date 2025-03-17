with
    source as (
        select *
        from {{ source('sales', 'salesreason') }}
    )
    
    , sales_reason as (
        select 
            salesreasonid
            , name as reason
            , reasontype
            , modifieddate
        from source
    )

select *
from sales_reason