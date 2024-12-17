WITH queries AS (
    SELECT
        access_history.query_id,
        CONVERT_TIMEZONE('UTC', query_history.start_time)::date AS query_date,
        query_history.user_name,
        query_history.query_text,
        access_history.direct_objects_accessed
    FROM snowflake.account_usage.access_history
    JOIN snowflake.account_usage.query_history
        ON access_history.query_id = query_history.query_id
    WHERE
        query_history.query_type = 'SELECT'
        AND query_history.execution_status = 'SUCCESS'
        AND query_history.query_text NOT LIKE '%%dbt_internal_test%%'
        AND query_history.start_time >= '%s'
        AND query_history.start_time < '%s'
),
flattened AS (
    SELECT
        queries.*,
        _tables.value:objectName::varchar AS table_name,
    FROM queries,
        LATERAL FLATTEN (input => direct_objects_accessed) AS _tables
    WHERE
        LOWER(_tables.value:objectDomain::varchar) IN ('table', 'view', 'materialized view')
        and LOWER(table_name) LIKE ANY (%s)
),
by_user AS (
    SELECT
        flattened.query_date,
        flattened.table_name,
        flattened.user_name,
        COUNT(*) AS query_count
    FROM flattened
    GROUP BY 1, 2, 3
),
final as (
    SELECT
        query_date,
        table_name,
        object_agg(user_name, query_count) as user_counts,
        sum(query_count) as query_count
    FROM
        by_user
    group by
        query_date, table_name
)
SELECT * FROM final;