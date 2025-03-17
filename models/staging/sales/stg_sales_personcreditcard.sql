with
    source as (
        select *
        from {{ source('sales', 'personcreditcard') }}
    )
    
    , person_credit_card as (
        select 
            businessentityid
            , creditcardid
            , modifieddate
        from source
    )

select *
from person_credit_card