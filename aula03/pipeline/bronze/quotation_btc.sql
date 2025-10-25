-- =====================================================
-- Bronze Layer: Bitcoin Quotations Data Ingestion
-- =====================================================
-- Descrição: Ingestão de cotações Bitcoin via cloud_files()
-- Fonte: /Volumes/lakehouse_imerssion/raw_public/quotation_btc
-- Schema: Inferência automática com header=true
-- Tipo: STREAMING TABLE para processamento incremental
-- =====================================================

CREATE OR REFRESH STREAMING TABLE bronze.quotation_btc
AS SELECT 
  *,
  current_timestamp() as ingested_at
FROM cloud_files(
  "/Volumes/lakehouse_imerssion/raw_public/quotation_btc",
  "csv",
  map("header", "true", "inferSchema", "true")
);
