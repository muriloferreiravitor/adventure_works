with
    dim_location as (
        select *
        from {{ ref('int_location') }}
    )

select *
from dim_location