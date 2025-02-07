with
    source as (
        select *
        from {{ source('sales', 'salesorderdetail') }}
    )
    
    , sales_order_detail as (
        select 
            salesorderid
            , salesorderdetailid
            , productid
            , orderqty
            , unitprice
            , unitpricediscount
            -- TODO: adicionar teste para gerar um warning caso o valor final seja 0.0
            , greatest(coalesce(unitprice * (1.0 - coalesce(unitpricediscount, 0.0)) * orderqty, 0.0), 0.0) as linetotal
            , modifieddate
        from source
    )

select *
from sales_order_detail 
