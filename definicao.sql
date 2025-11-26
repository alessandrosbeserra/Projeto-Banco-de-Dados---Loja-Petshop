-- CRIANADO O BANCO DE DADOS
CREATE DATABASE loja_petshop;

-- DEIXANDO O BANCO DE DADOS CRIADO EM USO
USE loja_petshop;

-- OS DADOS DAS TABELAS ABAIXOS FORAM FICTÍCIOS CRIADOS EM CSV, EU IMPORTEI OS ARQUIVOS RENOMEANDO
-- AS TABELAS MAIS ABAIXO E INSERINDO OS DADDOS DAS TABELAS IMPORTADAS NAS NOVAS TABELAS.

select * from backup_clientes;
select * from backup_pedidos;
select * from backup_produtos;
select * from backup_itens_pedido;
select * from backup_pagamentos;

-- '''''''PREPARAÇÃO DO BANCO DE DADOS''''''

-- NESSAS NOVAS TABELAS E QUE VOU ARMAZENAR OS DADOS IMPORTADOS
-- CRIANDO A TABELA CLIENTES
CREATE TABLE IF NOT EXISTS clientes (
    cliente_id INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    endereco VARCHAR(255),
    data_cadastro DATE
);
 
 -- CRIANDO A TABELA ITENS PRODUTOS
CREATE TABLE IF NOT EXISTS produtos (
	id_produto INT PRIMARY KEY,
    nome VARCHAR(200),
    categoria VARCHAR(50),
    preco DECIMAL(10,2),
    estoque INT,
    fornecedor VARCHAR(255)
    );

-- CRIANDO A TABELA ITENS PEDIDOS
CREATE TABLE IF NOT EXISTS pedidos (
    id_pedido INT PRIMARY KEY,
    cliente_id INT,
    data_pedido DATE,
    status VARCHAR(20),  -- Ex: Pendente, Pago, Enviado, Entregue
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
 );
    
     -- CRIANDO A TABELA INTENS ITENS_PEDIDO
    CREATE TABLE IF NOT EXISTS itens_pedido (
    id_item INT PRIMARY KEY,
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2) ,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);
 
-- CRIANDO A TABELA INTENS PAGAMENTOS
CREATE TABLE IF NOT EXISTS pagamentos (
	id_pagamento INT,
    id_pedido INT,
    data_pagamento DATE,
    valor_pago DECIMAL (10,2),
    metodo_pagamento VARCHAR(12),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
);


-- TRANSFERINDO OS DADOS DAS TABELAS IMPORTADAS CSV PARA AS TABELAS CRIADAS ACIMA.
INSERT INTO clientes SELECT * FROM backup_clientes;
INSERT INTO produtos SELECT * FROM backup_produtos;
INSERT INTO pedidos SELECT * FROM backup_pedidos;
INSERT INTO itens_pedido SELECT * FROM backup_itens_pedido;
INSERT INTO pagamentos SELECT * FROM backup_pagamentos;

-- VISUALIZANDO OS DADOS DE CADA TABELA
select * from clientes;
select * from produtos;
select * from pedidos;
select * from pagamentos;
select * from itens_pedido;



