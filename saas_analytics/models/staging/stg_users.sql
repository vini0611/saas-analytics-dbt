with source as (

    select * from {{ source('saas_analytics', 'raw_users') }}

),

renamed as (

    select
        user_id,
        customer_id,
        first_name,
        last_name,
        email,
        role,
        cast(created_date as date)              as created_date,
        cast(last_login_date as date)           as last_login_date,
        status

    from source

)

select * from renamed