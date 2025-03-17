with
    source as (
        select *
        from {{ source('person', 'person') }}
    )
    
    , person as (
        select 
            businessentityid
            , persontype
            , firstname
            , middlename
            , lastname
            , TRIM(
                coalesce(firstname, '') || ' ' ||
                coalesce(middlename || ' ', '') ||
                coalesce(lastname, '')
            ) AS fullname
            , modifieddate
        from source
    )

select *
from person