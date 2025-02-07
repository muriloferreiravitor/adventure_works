with
    source as (
        select *
        from {{ source('person', 'address') }}
    )
    
    , address as (
        select 
            addressid
            , addressline1 as addressline
            , city
            , stateprovinceid
            , modifieddate
        from source
    )

select *
from address
