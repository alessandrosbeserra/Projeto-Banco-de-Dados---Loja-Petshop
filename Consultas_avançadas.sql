USE loja_petshop;

-- Total de Vendas por Mês
SELECT	
	DATE_FORMAT(p.data_pedido, '%y-%m') as mes,
    SUM(pg.valor_pago) AS total_vendas
FROM pedidos p
JOIN pagamentos pg on p.id_pedido = pg.id_pedido
GROUP BY mes
order by mes;

-- Criando View Resumo mensal de vendas finalizadas.
CREATE OR REPLACE VIEW vw_vendas_por_mes AS
SELECT 
    DATE_FORMAT(p.data_pedido, '%Y-%m') AS mes,
    SUM(pg.valor_pago) AS total_vendas
FROM pedidos p
JOIN pagamentos pg ON p.id_pedido = pg.id_pedido
GROUP BY mes
ORDER BY mes;

SELECT * FROM vw_vendas_por_mes;

-- Produtos Mais Vendidos (por quantidade)
SELECT 
	pr.nome,
    sum(ip.quantidade) AS total_vendido
FROM itens_pedido ip
JOIN produtos pr ON ip.id_produto = pr.id_produto
GROUP BY pr.nome
ORDER BY total_vendido DESC
LIMIT 20;

-- Criando View Lista dos produtos mais vendidos por quantidade total.
CREATE OR REPLACE VIEW vw_produtos_mais_vendidos AS
SELECT 
    pr.id_produto,
    pr.nome,
    pr.categoria,
    SUM(ip.quantidade) AS total_vendido
FROM itens_pedido ip
JOIN produtos pr ON ip.id_produto = pr.id_produto
GROUP BY pr.id_produto, pr.nome, pr.categoria
ORDER BY total_vendido DESC;

SELECT * FROM vw_produtos_mais_vendidos;

-- 10 Clientes que mais compraram (por valor total)
SELECT 
    c.nome,
    SUM(pg.valor_pago) AS total_gasto
FROM clientes c
JOIN pedidos p ON c.cliente_id = p.cliente_id
JOIN pagamentos pg ON p.id_pedido = pg.id_pedido
GROUP BY c.nome
ORDER BY total_gasto DESC
LIMIT 10;

-- Criando View Clientes que mais gastaram em pedidos finalizados.
CREATE OR REPLACE VIEW vw_clientes_top AS
SELECT 
    c.cliente_id,
    c.nome,
    SUM(pg.valor_pago) AS total_gasto
FROM clientes c
JOIN pedidos p ON c.cliente_id = p.cliente_id
JOIN pagamentos pg ON p.id_pedido = pg.id_pedido
GROUP BY c.cliente_id, c.nome
ORDER BY total_gasto DESC;

SELECT * FROM vw_clientes_top;

-- Estoque atual dos produtos
SELECT
	nome,
    categoria,
    estoque
FROM produtos
ORDER BY estoque ASC;

-- Criando View Produtos com estoque igual ou abaixo de 20 unidades.
CREATE OR REPLACE VIEW vw_estoque_baixo AS
SELECT 
    id_produto,
    nome,
    categoria,
    estoque
FROM produtos
WHERE estoque <= 20
ORDER BY estoque ASC;

SELECT * FROM vw_estoque_baixo;


-- Faturamento total por categoria de produto
SELECT 
	pr.categoria,
    SUM(ip.quantidade * ip.preco_unitario) AS total_vendas
FROM itens_pedido ip
JOIN produtos pr ON ip.id_produto = pr.id_produto
JOIN pedidos p ON ip.id_pedido = p.id_pedido
WHERE p.status = 'Finalizado'
GROUP BY pr.categoria
ORDER BY total_vendas DESC;

-- Criando View Total de vendas por categoria de produto.
CREATE OR REPLACE VIEW vw_faturamento_por_categoria AS
SELECT 
    pr.categoria,
    SUM(ip.quantidade * ip.preco_unitario) AS total_vendas
FROM itens_pedido ip
JOIN produtos pr ON ip.id_produto = pr.id_produto
JOIN pedidos p ON ip.id_pedido = p.id_pedido
WHERE p.status = 'Finalizado'
GROUP BY pr.categoria
ORDER BY total_vendas DESC;

SELECT * FROM vw_faturamento_por_categoria;

-- Valor médio por pedido
SELECT 
	ROUND(AVG(pg.valor_pago), 2) AS Valor_Medio_Pedido
    FROM pagamentos pg;

-- Quantidade de pedidos por status
SELECT 
	status,
    COUNT(*) AS Quantidade
FROM pedidos
GROUP BY status;

-- Criando View Resumo de cada pedido com cliente, data, status e valor total.
CREATE OR REPLACE VIEW vw_pedidos_detalhados AS
SELECT 
    p.id_pedido,
    c.nome AS cliente,
    p.data_pedido,
    p.status,
    pg.valor_pago,
    pg.metodo_pagamento
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.cliente_id
LEFT JOIN pagamentos pg ON p.id_pedido = pg.id_pedido;

select * from vw_pedidos_detalhados;

