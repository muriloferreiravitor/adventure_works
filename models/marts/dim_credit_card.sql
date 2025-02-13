with
    dim_credit_card as (
        select *
        from {{ ref('int_credit_card') }}
    )

select *
from dim_credit_card