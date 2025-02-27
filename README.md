# PROJETO DE TRATAMENTO | ETL COM SQL

Este repositório contém um projeto de **ETL (Extract, Transform, Load)** desenvolvido em **SQL**, utilizando dados da empresa fictícia **Olist**. O objetivo é simular um fluxo completo de tratamento e preparação de dados para análise, integrando informações de pedidos, clientes e produtos.

---

## 🔗 Dataset Utilizado
Os dados utilizados neste projeto foram obtidos a partir do seguinte repositório público:

- [Olist Store Dataset - Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

---

## 📂 Estrutura do Repositório

| Arquivo                   | Descrição                                                                 |
|-------------------|--------------------------------------------------------------------------------|
| Processo_ETL.sql          | Script completo do processo ETL, com extração, transformação e carga dos dados. |
| Criando_PRIMARY_KEY.sql   | Script responsável por criar as chaves primárias nas tabelas fato.  |
| Criando_FOREIGN_KEY.sql   | Script responsável por criar as chaves estrangeiras para relacionar as tabelas. |


---

## ⚙️ Fluxo ETL

### 1️⃣ Extract (Extração)
Coleta de dados diretamente das tabelas transacionais brutas da Olist, incluindo pedidos, clientes e itens de pedidos.

### 2️⃣ Transform (Transformação)
Aplicação de transformações para:
- Limpeza e padronização de dados.
- Junções entre tabelas para consolidar informações.
- Cálculo de métricas como valor total do pedido.

### 3️⃣ Load (Carga)
Criação de uma tabela final consolidada, já pronta para análises e visualizações futuras.

---

## 📊 Diagrama de Relacionamento
<img src= "https://github.com/Vivian-M03/olist-etl-project/blob/main/Imagens/Official_Entity_Relationship_Diagram_OLIST.jpg">
---

## 🚀 Tecnologias Utilizadas
- SQL (linguagem de manipulação e transformação de dados)
- Banco de Dados Relacional (ex: MySQL, PostgreSQL, SQL Server — adaptável)
- Git e GitHub para versionamento

---

## 📊 Objetivo do Projeto
Este projeto foi criado para:
- Praticar a construção de um pipeline ETL completo usando SQL.
- Reforçar o uso de boas práticas na criação de chaves primárias, estrangeiras e modelagem relacional.
- Simular um case real de tratamento de dados de e-commerce para análises.

---

## 💡 Como Utilizar
1. Clone este repositório.
2. Execute os scripts de criação de chaves (`PRIMARY_KEY` e `FOREIGN_KEY`).
3. Execute o script `Processo_ETL.sql` para gerar a tabela consolidada.
4. Pronto! Sua tabela final estará disponível para análises.

---

🧰 **Desenvolvido por:** Vivian Franco
