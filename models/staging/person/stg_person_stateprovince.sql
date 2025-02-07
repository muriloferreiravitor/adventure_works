with
    source as (
        select *
        from {{ source('person', 'stateprovince') }}
    )
    
    , state_province as (
        select 
            stateprovinceid
            , name as state_name
            , territoryid
            , stateprovincecode
            , countryregioncode
            , modifieddate
        from source
    )

select *
from state_province
