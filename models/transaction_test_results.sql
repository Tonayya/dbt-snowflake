{{ config(materialized='table') }}

-- Run the test macro
{{ test_rollback_issue() }}

-- Query the results
SELECT 
    id,
    test_case,
    inserted_at,
    'Present rows indicate successful commits' as note
FROM {{ target.schema }}.test_transactions
ORDER BY id