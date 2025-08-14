WITH tblworkingdeposits_csv AS (
  SELECT
    *
  FROM {{ source('uploads', 'tblworkingdeposits_csv') }}
), stg_tblworkingdeposits_sql AS (
  SELECT
    *
  FROM tblworkingdeposits_csv
)
SELECT
  *
FROM stg_tblworkingdeposits_sql