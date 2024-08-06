WITH
source AS (
SELECT DISTINCT
*
FROM {{ ref('raw_users') }}
)
SELECT * FROM source

tags: ['something']