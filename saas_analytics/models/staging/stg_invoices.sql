with source as (

    select * from {{ source('saas_analytics', 'raw_invoices') }}

),

renamed as (

    select
        invoice_id,
        customer_id,
        subscription_id,
        cast(invoice_date as date)              as invoice_date,
        cast(amount_due as decimal(10,2))       as amount_due,
        cast(amount_paid as decimal(10,2))      as amount_paid,
        payment_status,
        cast(payment_date as date)              as payment_date

    from source

)

select * from renamed