with
    source as (
        select *
        from {{ source('sales', 'salesperson') }}
    )
    
    , sales_person as (
        select 
            businessentityid
            , territoryid
            , salesquota
            , bonus
            , commissionpct
            , salesytd
            , saleslastyear
            , modifieddate
        from source
    )

select *
from sales_person
