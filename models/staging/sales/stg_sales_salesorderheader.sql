with
    source as (
        select *
        from {{ source('sales', 'salesorderheader') }}
    )
    
    , sales_order_header as (
        select 
            salesorderid
            , billtoaddressid as addressid
            , customerid
            , territoryid
            , salespersonid
            , shiptoaddressid            
            , creditcardid
            , case
                when status = 1 then 'In process'
                when status = 2 then 'Approved'
                when status = 3 then 'Backordered'
                when status = 4 then 'Rejected'
                when status = 5 then 'Shipped'
                when status = 6 then 'Cancelled'
            end as sales_status
            , case
                when onlineorderflag = true then 'Online'
                when onlineorderflag = false then 'Physical'
            end as sales_channel
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