CREATE OR REFRESH STREAMING LIVE TABLE lakehouse_fivetran.bronze.sales_btc 
TBLPROPERTIES ("quality" = "bronze")
AS
SELECT
  *,
  current_timestamp() AS ingestion_ts_utc
FROM STREAM(lakehouse_fivetran.postgres_public.sales_btc);