## Observação sobre os arquivos SQL

Os arquivos `customers.sql`, `quotation_btc.sql`, `quotation_yfinance.sql`, `transaction_btc.sql` e `transaction_commodities.sql` foram fornecidos e utilizados como material de apoio durante a aula, servindo de referência para a modelagem e ingestão da camada bronze no Databricks.

> **Importante:**  
> Neste projeto, **não utilizei diretamente esses arquivos para a ingestão dos dados**.  
> Todos os dados da camada bronze foram carregados usando pipelines automatizados a partir das integrações realizadas via Fivetran, o que garantiu atualização e consistência dos dados a partir das fontes externas reais.

Esses scripts permanecem na pasta por transparência e documentação, mas a solução implementada para ingestão e carga foi baseada exclusivamente em dados originados por ETL com o Fivetran.
