with
    address as (
        select *
        from {{ ref('stg_person_address') }}
    )

    , country_region as (
        select *
        from {{ ref('stg_person_countryregion') }}
    )

    , state_province as (
        select *
        from {{ ref('stg_person_stateprovince') }}
    )

    , sales_territory as (
        select *
        from {{ ref('stg_sales_salesterritory') }}
    )

    , joined_location as (
        select
            address.addressid
            , address.stateprovinceid
            , state_province.territoryid
            , address.addressline
            , address.city
            , state_province.state_name
            , state_province.stateprovincecode
            , country_region.country_name
            , state_province.countryregioncode
            , sales_territory.continent
        from address
        left join state_province on address.stateprovinceid = state_province.stateprovinceid
        left join country_region on state_province.countryregioncode = country_region.countryregioncode
        left join sales_territory on state_province.territoryid = sales_territory.territoryid
    )

    , int_location as (
        select
            {{ dbt_utils.generate_surrogate_key(['addressid', 'addressline', 'city']) }} as sk_location
            , *
        from joined_location
    )    

select *
from int_location