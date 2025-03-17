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
            , case
                when TRIM(productline) = 'R' then 'Road'
                when TRIM(productline) = 'M' then 'Mountain'
                when TRIM(productline) = 'T' then 'Touring'
                when TRIM(productline) = 'S' then 'Standard'
            end as productline
            , case
                when TRIM(style) = 'W' then 'Womens'
                when TRIM(style) = 'M' then 'Mens'
                when TRIM(style) = 'U' then 'Universal'
            end as style
            , standardcost
            , listprice
            , modifieddate
        from source
    )

select *
from product