with
    dim_calendar as (
        select *
        from {{ ref('int_calendar') }}
    )

select *
from dim_calendar