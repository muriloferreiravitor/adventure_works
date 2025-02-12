with
    product as (
        select *
        from {{ ref('stg_production_product') }}
    )

    , product_subcategory as (
        select *
        from {{ ref('stg_production_productsubcategory') }}
    )

    , product_category as (
        select *
        from {{ ref('stg_production_productcategory') }}
    )

    , joined_product as (
        select
            product.productid
            , product.productsubcategoryid
            , product_subcategory.productcategoryid
            , product.product_name
            , product.productnumber
            , product.color
            , product.style
            , product_subcategory.product_subcategory
            , product_category.product_category
        from product
        left join product_subcategory on product.productsubcategoryid = product_subcategory.productsubcategoryid
        left join product_category on product_subcategory.productcategoryid = product_category.productcategoryid
    )

    , prep_dim_product as (
        select 
            {{ dbt_utils.generate_surrogate_key(['productid', 'productnumber']) }} as sk_product
            , *
        from joined_product
    )    

select *
from prep_dim_product