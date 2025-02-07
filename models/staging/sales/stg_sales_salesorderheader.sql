with
    source as (
        select *
        from {{ source('sales', 'salesorderheader') }}
    )
    
    , sales_order_header as (
        select 
            salesorderid
            , billtoaddressid
            , customerid
            , territoryid
            , salespersonid
            , shiptoaddressid            
            , status 
            , onlineorderflag
            , creditcardid
            , subtotal
            , taxamt
            , freight
            , totaldue
            , cast(orderdate as date) as orderdate
            , cast(duedate as date) as duedate
            , cast(shipdate as date) as shipdate
            , modifieddate
        from source
    )

select *
from sales_order_header
