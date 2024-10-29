{{
    config(
        materialized = "table",
        table_format = "iceberg",
        external_volume = "s3_iceberg_snow",
    )
}}

select 1 as id