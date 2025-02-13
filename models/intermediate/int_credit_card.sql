with
    credit_card as (
        select *
        from {{ ref('stg_sales_creditcard') }}
    )

    , person_credit_card as (
        select *
        from {{ ref('stg_sales_personcreditcard') }}
    )

    , joined_credit_card as (
        select 
            credit_card.creditcardid
            , person_credit_card.businessentityid
            , coalesce(credit_card.cardtype, 'Not informed') as cardtype
        from credit_card
        left join person_credit_card on credit_card.creditcardid = person_credit_card.creditcardid
    )

    , int_credit_card as (
        select 
            {{ dbt_utils.generate_surrogate_key(['creditcardid', 'cardtype']) }} as sk_credit_card
            , *
        from joined_credit_card
    )    

select *
from int_credit_card