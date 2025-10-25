-- =====================================================
-- Bronze Layer: yFinance Quotations Data Ingestion
-- =====================================================
-- Descrição: Ingestão de cotações yFinance via cloud_files()
-- Fonte: /Volumes/lakehouse_imerssion/raw_public/quotation_yfinance
-- Schema: Inferência automática com header=true
-- Tipo: STREAMING TABLE para processamento incremental
-- =====================================================

CREATE OR REFRESH STREAMING TABLE bronze.quotation_yfinance
AS SELECT 
  *,
  current_timestamp() as ingested_at
FROM cloud_files(
  "/Volumes/lakehouse_imerssion/raw_public/quotation_yfinance",
  "csv",
  map("header", "true", "inferSchema", "true")
);
