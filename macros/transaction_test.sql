{% macro test_rollback_issue() %}
    -- First, create a test table
    {% do run_query('CREATE TABLE IF NOT EXISTS ' ~ target.schema ~ '.test_transactions (
        id INT,
        test_case VARCHAR(100),
        inserted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    )') %}
    
    -- Clear any existing test data
    {% do run_query('DELETE FROM ' ~ target.schema ~ '.test_transactions') %}
    
    -- Case 1: With get_relation (likely to roll back)
    {% set relation = adapter.get_relation(target.database, target.schema, 'test_transactions') %}
    {% do run_query('INSERT INTO ' ~ target.schema ~ '.test_transactions (id, test_case) VALUES (1, \'With get_relation\')') %}
    {{ log("Case 1 executed: With get_relation", info=true) }}
    
    -- Case 2: With get_relation + commit (should persist)
    {% set relation = adapter.get_relation(target.database, target.schema, 'test_transactions') %}
    {% do run_query('INSERT INTO ' ~ target.schema ~ '.test_transactions (id, test_case) VALUES (2, \'With get_relation + commit\')') %}
    {% do adapter.commit() %}
    {{ log("Case 2 executed: With get_relation + commit", info=true) }}
    
    -- Case 3: Without get_relation (should persist)
    {% do run_query('INSERT INTO ' ~ target.schema ~ '.test_transactions (id, test_case) VALUES (3, \'Without get_relation\')') %}
    {{ log("Case 3 executed: Without get_relation", info=true) }}
    
    {{ log("All cases executed - check your test_transactions table", info=true) }}
{% endmacro %}