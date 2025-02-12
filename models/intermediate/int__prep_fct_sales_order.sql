with
    sales_order_header as (
        select *
        from {{ ref('stg_sales_salesorderheader') }}
    )

    , sales_order_detail as (
        select *
        from {{ ref('stg_sales_salesorderdetail') }}
    )

    , joined_atomic_orders as (
        select
            sales_order_detail.salesorderdetailid
            , sales_order_header.salesorderid
            , sales_order_header.billtoaddressid
            , sales_order_header.customerid
            , sales_order_header.territoryid
            , sales_order_header.salespersonid
            , sales_order_header.shiptoaddressid
            , sales_order_header.creditcardid
            , sales_order_detail.productid
            , sales_order_header.orderdate
            , sales_order_header.duedate
            , sales_order_header.shipdate
            , sales_order_header.modifieddate
            , sales_order_header.sales_status 
            , sales_order_header.sales_channel
            , sales_order_detail.orderqty
            , sales_order_detail.unitprice
            , sales_order_detail.unitpricediscount
            , sales_order_detail.had_discount
            , sales_order_detail.total_discount
            , sales_order_detail.total_gross
            , sales_order_detail.total_net
            , sales_order_header.freight / count(*) over(partition by sales_order_header.salesorderid) as prorated_freight
            , sales_order_header.taxamt / count(*) over(partition by sales_order_header.salesorderid) as prorated_taxamt
        from sales_order_detail
        left join sales_order_header on sales_order_detail.salesorderid = sales_order_header.salesorderid
    )

    , sales_atomic_metrics as (
        select
            salesorderdetailid
            , salesorderid
            , billtoaddressid
            , customerid
            , territoryid
            , salespersonid
            , shiptoaddressid
            , creditcardid
            , productid
            , orderdate
            , duedate
            , shipdate
            , modifieddate
            , sales_status 
            , sales_channel
            , orderqty
            , unitprice
            , unitpricediscount
            , had_discount
            , total_discount
            , total_gross
            , total_net
            , prorated_freight
            , prorated_taxamt
            , total_net + prorated_freight + prorated_taxamt as linetotal
        from joined_atomic_orders
    )

    , prep_fct_sales_order as (
        select 
            {{ dbt_utils.generate_surrogate_key(['salesorderdetailid', 'salesorderid']) }} as sk_sales_order
            , *
        from sales_atomic_metrics
    )    

select *
from prep_fct_sales_order