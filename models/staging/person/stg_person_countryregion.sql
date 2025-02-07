with
    source as (
        select *
        from {{ source('person', 'countryregion') }}
    )
    
    , country_region as (
        select 
            countryregioncode
            , name as country_name
            , modifieddate
        from source
    )

select *
from country_region