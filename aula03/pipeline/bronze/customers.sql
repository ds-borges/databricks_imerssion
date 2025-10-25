-- =====================================================
-- Bronze Layer: Customers Data Ingestion
-- =====================================================
-- Descrição: Ingestão de dados de clientes via cloud_files()
-- Fonte: /Volumes/lakehouse_imerssion/raw_public/customers
-- Schema: Inferência automática com header=true
-- Tipo: STREAMING TABLE para processamento incremental
-- =====================================================

CREATE OR REFRESH STREAMING TABLE bronze.customers
AS SELECT 
  *,
  current_timestamp() as ingested_at
FROM cloud_files(
  "/Volumes/lakehouse_imerssion/raw_public/customers",
  "csv",
  map("header", "true", "inferSchema", "true")
);
