with
    source as (
        select *
        from {{ source('sales', 'creditcard') }}
    )
    
    , credit_card as (
        select 
            creditcardid
            , cardtype
            , modifieddate
        from source
    )

select *
from credit_card
