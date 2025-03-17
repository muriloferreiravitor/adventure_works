with
    source as (
        select *
        from {{ source('production', 'productcategory') }}
    )
    
    , product_category as (
        select 
            productcategoryid
            , name as product_category
            , modifieddate
        from source
    )

select *
from product_category