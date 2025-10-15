# Data Engineering Roadmap: Arquitetura Medallion com Databricks 🧱

Bem-vindo ao meu repositório de aprendizado em **Engenharia de Dados** com foco em Databricks. Este espaço é um registro dos arquivos criados para estudo e aplicação na minha jornada de estudos em **Databricks**, **Delta Lake** e a **Arquitetura Medallion**, partindo da ingestão de dados brutos até a criação de camadas de consumo (Silver e Gold).

O objetivo é documentar cada etapa da imersão, registrando a configuração do ambiente, os pipelines de ingestão e as transformações de dados, criando um portfólio prático do estudo profissionalizante em Databricks.

---

## 💻 Tecnologias e Ferramentas

Aqui estão as tecnologias que estou estudando e aplicando neste roadmap, com foco em uma stack moderna de Engenharia de Dados:

![Databricks](https://img.shields.io/badge/Databricks-FF3621?style=for-the-badge&logo=databricks&logoColor=white)
![Delta Lake](https://img.shields.io/badge/Delta_Lake-007FFF?style=for-the-badge&logo=apache-spark&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![PL/pgSQL](https://img.shields.io/badge/PL/pgSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)

---

## 📂 Estrutura do Repositório (Modelo Medallion)

O repositório está organizado de forma a representar as fases da **Arquitetura Medallion** (Bronze, Silver e Gold), seguindo a estrutura do *bootcamp*. Cada pasta contém seu próprio `README.md` com detalhes específicos sobre a ingestão e transformação dos dados.

| Módulo / Pasta | Descrição | Foco Arquitetural | Status |
| :--- | :--- | :--- | :--- |
| `Aula01-bronze/` | **Simulação e Ingestão de Dados Brutos:** Configuração do banco de dados de origem (PostgreSQL/Supabase) e criação de jobs `cron` (via funções PL/pgSQL) para simular o fluxo de dados brutos (`sales_btc` e `sales_commodities`). | **Camada Bronze** (Raw Data) | ⏳ Em Andamento  |

## 👨‍💻 Autor e Contato

**Diego Sousa Borges**

* **LinkedIn:** `https://www.linkedin.com/in/ds-borges/`
* **GitHub:** `https://github.com/ds-borges`

---

## Referências e Inspirações

Este repositório é parte do meu estudo e aplicação dos conceitos aprendidos na **Imersão em Databricks da Jornada de dados**.

**Créditos:** A estrutura e a metodologia de estudo são inspiradas e baseadas no conteúdo e *roadmap* fornecido por **Luciano Galvão**, o github pode ser acessado pelo link [imersao_databricks_aovivo](https://github.com/lvgalvao/imersao_databricks_aovivo/tree/main).