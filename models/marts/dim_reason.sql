with
    dim_reason as (
        select *
        from {{ ref('int_reason') }}
    )

select *
from dim_reason