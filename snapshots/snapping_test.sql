{% snapshot snapping_test %}

{{
    config(
      target_database='analytics',
      target_schema='dbt_tonayya',
      unique_key='customer_id',

      strategy='check',
      check_cols = 'all'
    )
}}

select * from {{ ref('not_test') }}

{% endsnapshot %}