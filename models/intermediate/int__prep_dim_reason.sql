with
    sales_order_header_sales_reason as (
        select *
        from {{ ref('stg_sales_salesorderheadersalesreason') }}
    )

    , sales_reason as (
        select *
        from {{ ref('stg_sales_salesreason') }}
    )

    , joined_reason as (
        select
            sales_order_header_sales_reason.salesorderid
            , coalesce(listagg(sales_reason.reason, ', '), 'Not informed') as reason_agg
        from sales_order_header_sales_reason
        left join sales_reason on sales_order_header_sales_reason.salesreasonid = sales_reason.salesreasonid
        group by sales_order_header_sales_reason.salesorderid
    )

    , prep_dim_reason as (
        select
            {{ dbt_utils.generate_surrogate_key(['salesorderid', 'reason_agg']) }} as sk_reason
            , *
        from joined_reason
    )

select *
from prep_dim_reason