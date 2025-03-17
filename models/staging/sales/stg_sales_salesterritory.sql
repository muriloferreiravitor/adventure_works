with
    source as (
        select *
        from {{ source('sales', 'salesterritory') }}
    )
    
    , sales_territory as (
        select 
            territoryid
            , name as region_name
            , countryregioncode
            , "group" as continent
            , salesytd
            , saleslastyear
            , modifieddate
        from source
    )

select *
from sales_territory