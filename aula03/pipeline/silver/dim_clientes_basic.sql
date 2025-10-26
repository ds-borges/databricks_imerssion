CREATE OR REPLACE TABLE lakehouse.silver.dim_clientes AS
SELECT
  customer_id,
  customer_name,
  SHA2(documento, 256) AS documento_hash,
  segmento,
  pais,
  estado,
  cidade,
  CAST(created_at AS TIMESTAMP) AS created_at,
  CURRENT_TIMESTAMP() AS processed_at
FROM lakehouse.bronze.customers
WHERE
  customer_id IS NOT NULL
  AND segmento IN ('Financeiro', 'Indústria', 'Varejo', 'Tecnologia')
  AND pais IN ('Brasil', 'Alemanha', 'Estados Unidos')
  AND (
    pais <> 'Brasil'
    OR estado IN ('SE','RS', 'PA', 'AL', 'MT', 'SP', 'RJ', 'MG', 'PR', 'SC', 'BA', 'GO', 'PE', 'CE', 'MA', 'PB', 'AM', 'ES', 'RN', 'AC', 'AP', 'RO', 'RR', 'TO', 'MS', 'DF')
  );
