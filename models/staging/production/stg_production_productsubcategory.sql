with
    source as (
        select *
        from {{ source('production', 'productsubcategory') }}
    )
    
    , product_subcategory as (
        select 
            productsubcategoryid
            , productcategoryid
            , name as product_subcategory
            , modifieddate
        from source
    )

select *
from product_subcategory
