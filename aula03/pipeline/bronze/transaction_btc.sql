-- =====================================================
-- Bronze Layer: Bitcoin Transactions Data Ingestion
-- =====================================================
-- Descrição: Ingestão de transações Bitcoin via cloud_files()
-- Fonte: /Volumes/lakehouse_imerssion/raw_public/transacation_btc
-- Schema: Inferência automática com header=true
-- Tipo: STREAMING TABLE para processamento incremental
-- =====================================================

CREATE OR REFRESH STREAMING TABLE bronze.transaction_btc
AS SELECT 
  *,
  current_timestamp() as ingested_at
FROM cloud_files(
  "/Volumes/lakehouse_imerssion/raw_public/transacation_btc",
  "csv",
  map("header", "true", "inferSchema", "true")
);
