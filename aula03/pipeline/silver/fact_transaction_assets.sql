CREATE OR REPLACE TABLE lakehouse.silver.fact_transaction_assets AS
SELECT 
  transaction_id,
  CAST(data_hora AS TIMESTAMP) AS data_hora,
  DATE_TRUNC('hour', CAST(data_hora AS TIMESTAMP)) AS data_hora_aproximada,
  quantidade,
  tipo_operacao,
  moeda,
  cliente_id,
  canal,
  mercado,
  arquivo_origem,
  importado_em,
  -- Mapeamento de símbolos padronizado
  CASE 
    WHEN UPPER(COALESCE(ativo, commodity_code)) IN ('BTC','BTC-USD') THEN 'BTC'
    WHEN UPPER(COALESCE(ativo, commodity_code)) IN ('GOLD','GC=F')   THEN 'GOLD'
    WHEN UPPER(COALESCE(ativo, commodity_code)) IN ('OIL','CL=F')    THEN 'OIL'
    WHEN UPPER(COALESCE(ativo, commodity_code)) IN ('SILVER','SI=F') THEN 'SILVER'
    ELSE 'UNKNOWN'
  END AS asset_symbol,
  CURRENT_TIMESTAMP() AS processed_at
FROM (
  -- Transações de Bitcoin
  SELECT 
    transaction_id,
    data_hora,
    ativo,
    NULL AS commodity_code,
    quantidade,
    tipo_operacao,
    moeda,
    cliente_id,
    canal,
    mercado,
    arquivo_origem,
    importado_em
  FROM lakehouse.bronze.sales_btc
  
  UNION ALL
  
  -- Transações de Commodities
  SELECT 
    transaction_id,
    data_hora,
    NULL AS ativo,
    commodity_code,
    quantidade,
    tipo_operacao,
    moeda,
    cliente_id,
    canal,
    mercado,
    arquivo_origem,
    importado_em
  FROM lakehouse.bronze.sales_commodities
) sub
WHERE
  quantidade > 0
  AND data_hora IS NOT NULL
  AND tipo_operacao IN ('COMPRA','VENDA')
  AND CASE 
        WHEN UPPER(COALESCE(ativo, commodity_code)) IN ('BTC','BTC-USD') THEN 'BTC'
        WHEN UPPER(COALESCE(ativo, commodity_code)) IN ('GOLD','GC=F')   THEN 'GOLD'
        WHEN UPPER(COALESCE(ativo, commodity_code)) IN ('OIL','CL=F')    THEN 'OIL'
        WHEN UPPER(COALESCE(ativo, commodity_code)) IN ('SILVER','SI=F') THEN 'SILVER'
        ELSE 'UNKNOWN'
      END IN ('BTC', 'GOLD', 'OIL', 'SILVER');
