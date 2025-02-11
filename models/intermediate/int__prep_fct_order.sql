with
    sales_order_header as (
        select *
        from {{ ref('stg_sales_salesorderheader') }}
    )

    , sales_order_detail as (
        select *
        from {{ ref('stg_sales_salesorderdetail') }}
    )

    , joined_order as (
        select
            sales_order_header.salesorderid
            , sales_order_detail.salesorderdetailid
            , sales_order_header.billtoaddressid
            , sales_order_header.customerid
            , sales_order_header.territoryid
            , sales_order_header.salespersonid
            , sales_order_header.shiptoaddressid
            , sales_order_detail.productid
            , sales_order_header.status 
            , sales_order_header.onlineorderflag
            , sales_order_header.creditcardid
            , sales_order_detail.orderqty
            , sales_order_detail.unitprice
            , sales_order_detail.unitpricediscount
            , sales_order_detail.linetotal
            , sales_order_header.subtotal
            , sales_order_header.taxamt
            , sales_order_header.freight
            , sales_order_header.totaldue
            , sales_order_header.orderdate
            , sales_order_header.duedate
            , sales_order_header.shipdate
            , sales_order_header.modifieddate
        from sales_order_detail
        left join sales_order_header on sales_order_detail.salesorderid = sales_order_header.salesorderid
    )
/*
    , prep_dim_credit_card as (
        select 
            {{ dbt_utils.generate_surrogate_key(['creditcardid', 'cardtype']) }} as sk_credit_card
            , *
        from joined_credit_card
    )    
*/
select count(*)
from joined_order