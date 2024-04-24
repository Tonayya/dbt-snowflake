With whatever AS (
    SELECT * FROM {{ ref('foo') }}
),

investor_type_mapping AS (
    SELECT * FROM {{ ref('stg_abc') }}
),

final AS (
    SELECT * FROM whatever
    SELECT * FROM investor_type_mapping
)

SELECT * from final