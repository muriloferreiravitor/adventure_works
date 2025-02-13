with
    customer as (
        select *
        from {{ ref('stg_sales_customer') }}
    )

    , person as (
        select *
        from {{ ref('stg_person_person') }}
    )

    , joined_customer as (
        select 
            customer.customerid
            , person.businessentityid
            , customer.storeid
            , person.fullname
        from customer
        left join person on customer.customerid = person.businessentityid
        where person.persontype = 'IN'
    )

    , int_customer as (
        select
            {{ dbt_utils.generate_surrogate_key(['customerid', 'businessentityid', 'fullname']) }} as sk_customer
            , *
        from joined_customer
    )    

select *
from int_customer