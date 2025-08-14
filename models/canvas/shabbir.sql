WITH stg_tblworkingdeposits AS (
  SELECT
    *
  FROM {{ ref('stg_tblWorkingDeposits') }}
), shabbir_sql AS (
  SELECT
    *
  FROM stg_tblworkingdeposits
)
SELECT
  *
FROM shabbir_sql