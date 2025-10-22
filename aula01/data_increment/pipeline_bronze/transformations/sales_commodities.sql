-- No arquivo sales_commodities.sql
CREATE OR REFRESH STREAMING LIVE TABLE lakehouse_fivetran.bronze.sales_commodities  -- Nome da tabela de commodities
TBLPROPERTIES ("quality" = "bronze")
AS
SELECT
    CURRENT_TIMESTAMP() AS ingestion_ts_utc,
    *
FROM STREAM(lakehouse_fivetran.postgres_public.sales_commodities);  -- Fonte de commodities