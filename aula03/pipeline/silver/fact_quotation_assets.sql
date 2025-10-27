CREATE OR REPLACE TABLE silver.fact_quotation_assets AS
SELECT 
  CASE 
    WHEN UPPER(ativo) IN ('BTC','BTC-USD') THEN 'BTC'
    WHEN UPPER(ativo) IN ('GOLD','GC=F')   THEN 'GOLD'
    WHEN UPPER(ativo) IN ('OIL','CL=F')    THEN 'OIL'
    WHEN UPPER(ativo) IN ('SILVER','SI=F') THEN 'SILVER'
    ELSE 'UNKNOWN'
  END AS asset_symbol,
  ativo AS ativo_original,
  preco,
  moeda,
  CAST(horario_coleta AS TIMESTAMP) AS timestamp_cotacao,
  DATE_TRUNC('hour', CAST(horario_coleta AS TIMESTAMP)) AS data_hora_aproximada,
  CURRENT_TIMESTAMP() AS processed_at
FROM (
  SELECT ativo, preco, moeda, horario_coleta FROM bronze.bitcoin
  UNION ALL
  SELECT ativo, preco, moeda, horario_coleta FROM bronze.yfinance
) sub
WHERE
  preco > 0
  AND CAST(horario_coleta AS TIMESTAMP) <= CURRENT_TIMESTAMP()
  AND ativo IS NOT NULL
  AND ativo != ''
  AND moeda = 'USD';
