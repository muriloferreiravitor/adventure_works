with
    source as (
        select *
        from {{ source('person', 'stateprovince') }}
    )
    
    , state_province as (
        select 
            stateprovinceid
            , territoryid
            , stateprovincecode
            , countryregioncode
            , name as state_name
            , modifieddate
        from source
    )

select *
from state_province