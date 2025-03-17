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
            , case
                when unitpricediscount > 0 then true
                else false
            end as had_discount
            , greatest(coalesce(unitprice * coalesce(unitpricediscount, 0.0) * orderqty, 0.0), 0.0) as total_discount
            , greatest(coalesce(unitprice * orderqty, 0.0), 0.0) as total_gross
            , greatest(coalesce(unitprice * (1.0 - coalesce(unitpricediscount, 0.0)) * orderqty, 0.0), 0.0) as total_net
            , modifieddate
        from source
    )

select *
from sales_order_detail