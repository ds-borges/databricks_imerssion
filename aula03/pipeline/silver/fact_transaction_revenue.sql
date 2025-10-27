CREATE OR REPLACE TABLE lakehouse.silver.fact_transaction_revenue AS
SELECT 
  t.transaction_id,
  t.data_hora,
  t.data_hora_aproximada,
  t.asset_symbol,
  t.quantidade,
  t.tipo_operacao,
  t.moeda,
  t.cliente_id,
  t.canal,
  t.mercado,
  t.arquivo_origem,
  t.importado_em,
  -- Dados da cotação
  q.preco AS preco_cotacao,
  q.timestamp_cotacao,
  q.ativo_original,
  -- Dados do cliente
  c.customer_id AS customer_sk,
  c.customer_name,
  c.segmento,
  c.pais,
  c.estado,
  c.cidade,
  -- Cálculos financeiros
  (t.quantidade * q.preco) AS gross_value,
  -- Lógica do sinal: VENDA(+) / COMPRA(-)
  CASE 
    WHEN t.tipo_operacao = 'VENDA' THEN (t.quantidade * q.preco)
    WHEN t.tipo_operacao = 'COMPRA' THEN -(t.quantidade * q.preco)
    ELSE 0
  END AS gross_value_sinal,
  -- Receita de taxa: 0.25% sobre valor total
  (t.quantidade * q.preco * 0.0025) AS fee_revenue,
  CURRENT_TIMESTAMP() AS processed_at
FROM lakehouse.silver.fact_transaction_assets t
INNER JOIN lakehouse.silver.fact_quotation_assets q
  ON t.asset_symbol = q.asset_symbol 
  AND t.data_hora_aproximada = q.data_hora_aproximada
INNER JOIN lakehouse.silver.dim_clientes c
  ON t.cliente_id = c.customer_id
WHERE
  (t.quantidade * q.preco) > 0                             -- gross_value_positivo
  AND (t.quantidade * q.preco * 0.0025) > 0                -- fee_revenue_positivo
  AND c.customer_id IS NOT NULL                            -- customer_sk_nao_nulo
  AND q.preco > 0
  AND q.timestamp_cotacao <= t.data_hora                   -- preco_cotacao_positivo
;
