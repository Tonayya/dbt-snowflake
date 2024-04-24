With
investor_type_mapping AS (
SELECT DISTINCT
*
FROM {{ ref('stg_abc') }}
)
SELECT * FROM investor_type_mapping