# 🐾 Projeto Banco de Dados - Loja Petshop

Este projeto consiste na criação e preparação de um banco de dados para uma loja de petshop, utilizando **MySQL**. Os dados foram inicialmente importados de arquivos CSV fictícios e organizados em tabelas normalizadas.

---

## 📂 Estrutura do Projeto

- **Banco de Dados:** `loja_petshop`
- **Tabelas Criadas:**
  - `clientes`
  - `produtos`
  - `pedidos`
  - `itens_pedido`
  - `pagamentos`

---

## 🔍 Objetivo

- Criar um banco de dados relacional para gerenciar clientes, produtos, pedidos e pagamentos.
- Importar dados fictícios de arquivos CSV para as tabelas criadas.
- Garantir integridade referencial com chaves primárias e estrangeiras.

---

## 🛠️ Tecnologias Utilizadas

- **MySQL**
- **CSV para importação de dados**
- **Workbench ou CLI para execução das queries**

---

## 📜 Passos do Projeto

1. **Criação do Banco de Dados**
    ```sql
    CREATE DATABASE loja_petshop;
    USE loja_petshop;
    ```

2. **Criação das Tabelas**
    - Clientes
    - Produtos
    - Pedidos
    - Itens do Pedido
    - Pagamentos

3. **Importação dos Dados**
    ```sql
    INSERT INTO clientes SELECT * FROM backup_clientes;
    INSERT INTO produtos SELECT * FROM backup_produtos;
    INSERT INTO pedidos SELECT * FROM backup_pedidos;
    INSERT INTO itens_pedido SELECT * FROM backup_itens_pedido;
    INSERT INTO pagamentos SELECT * FROM backup_pagamentos;
    ```

4. **Consultas para Visualização**
    ```sql
    SELECT * FROM clientes;
    SELECT * FROM produtos;
    SELECT * FROM pedidos;
    SELECT * FROM itens_pedido;
    SELECT * FROM pagamentos;
    ```

---

## 📁 Organização dos Arquivos

- `scripts/`
  - `01_criacao_banco.sql`
  - `02_criacao_tabelas.sql`
  - `03_importacao_dados.sql`
  - `04_consultas.sql`
- `data/`
  - `backup_clientes.csv`
  - `backup_produtos.csv`
  - `backup_pedidos.csv`
  - `backup_itens_pedido.csv`
  - `backup_pagamentos.csv`

---

## ✅ Como Executar

1. Clone este repositório:
    ```bash
    git clone https://github.com/seuusuario/nome-do-repositorio.git
    ```
2. Importe os arquivos `.sql` no MySQL Workbench ou CLI.
3. Certifique-se de que os arquivos CSV estão na pasta `data/` para importação.

---

## 📌 Autor
**Alessandro Silva Beserra**

---

### 🔗 Próximos Passos
- Criar consultas avançadas (JOIN, agregações, relatórios).
- Implementar índices para otimização.
- Criar triggers ou procedures para automação.

