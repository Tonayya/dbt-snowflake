{{
  config(
    materialized = "table",
    table_format="iceberg",
    external_volume="s3_iceberg_snow",
  )
}}

Select * from {{ ref('raw_users') }}
where name != 'jessica'