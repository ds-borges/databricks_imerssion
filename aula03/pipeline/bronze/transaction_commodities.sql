-- =====================================================
-- Bronze Layer: Commodities Transactions Data Ingestion
-- =====================================================
-- Descrição: Ingestão de transações de commodities via cloud_files()
-- Fonte: /Volumes/lakehouse_imerssion/raw_public/transaction_commodities
-- Schema: Inferência automática com header=true
-- Tipo: STREAMING TABLE para processamento incremental
-- =====================================================

CREATE OR REFRESH STREAMING TABLE bronze.transaction_commodities
AS SELECT 
  *,
  current_timestamp() as ingested_at
FROM cloud_files(
  "/Volumes/lakehouse_imerssion/raw_public/transaction_commodities",
  "csv",
  map("header", "true", "inferSchema", "true")
);
