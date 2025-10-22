CREATE OR REFRESH STREAMING LIVE TABLE lakehouse_fivetran.bronze.yfinance
TBLPROPERTIES ("quality" = "bronze")
AS
SELECT *
FROM cloud_files(
  '/Volumes/lakehouse_fivetran/raw/yfinance/commodities/latest_prices/',
  'json'
);