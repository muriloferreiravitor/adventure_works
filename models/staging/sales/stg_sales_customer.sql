with
    source as (
        select *
        from {{ source('sales', 'customer') }}
    )
    
    , customer as (
        select 
            customerid
            , personid
            , storeid
            , territoryid
            , modifieddate
        from source
    )

select *
from customer 
