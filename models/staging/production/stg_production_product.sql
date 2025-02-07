with
    source as (
        select *
        from {{ source('production', 'product') }}
    )
    
    , product as (
        select 
            productid
            , productsubcategoryid
            , name as product_name
            , productnumber
            , color
            , size
            , productline
            , style
            , standardcost
            , listprice
            , modifieddate
        from source
    )

select *
from product
