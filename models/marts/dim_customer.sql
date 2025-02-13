with
    dim_customer as (
        select *
        from {{ ref('int_customer') }}
    )

select *
from dim_customer