investor_type_mapping AS (
SELECT DISTINCT * FROM {{ ref('raw_users') }}
)