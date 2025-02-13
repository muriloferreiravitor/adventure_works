with
    sales_order as (
        select *
        from {{ ref('int_sales_order') }}
    )

    , calendar as (
        select *
        from {{ ref('dim_calendar') }}
    )

    , credit_card as (
        select *
        from {{ ref('dim_credit_card') }}
    )

    , customer as (
        select *
        from {{ ref('dim_customer') }}
    )

    , location as (
        select *
        from {{ ref('dim_location') }}
    )

    , product as (
        select *
        from {{ ref('dim_product') }}
    )

    , reason as (
        select *
        from {{ ref('dim_reason') }}
    )

    , fct_sales_order as (
        select
            sales_order.sk_sales_order
            , calendar.sk_calendar as fk_calendar
            , credit_card.sk_credit_card as fk_credit_card
            , customer.sk_customer as fk_customer
            , location.sk_location as fk_location
            , product.sk_product as fk_product
            , reason.sk_reason as fk_reason
            , sales_order.orderdate
            , sales_order.duedate
            , sales_order.shipdate
            , sales_order.modifieddate
            , sales_order.salesorderid
            , sales_order.sales_status 
            , sales_order.sales_channel
            , sales_order.orderqty
            , sales_order.unitprice
            , sales_order.unitpricediscount
            , sales_order.had_discount
            , sales_order.total_discount
            , sales_order.total_gross
            , sales_order.total_net
            , sales_order.prorated_freight
            , sales_order.prorated_taxamt
            , sales_order.linetotal
        from sales_order
        left join calendar on sales_order.orderdate = calendar.date_day
        left join credit_card on sales_order.creditcardid = credit_card.creditcardid
        left join customer on sales_order.customerid = customer.customerid
        left join location on sales_order.addressid = location.addressid
        left join product on sales_order.productid = product.productid
        left join reason on sales_order.salesorderid = reason.salesorderid
    )

select *
from fct_sales_order