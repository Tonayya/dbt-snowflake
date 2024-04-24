With
investor_type_mapping AS (
SELECT DISTINCT
*
FROM {{ ref('raw_users') }}
)
SELECT * FROM investor_type_mapping