CREATE VIEW v_pedidos_detalhados AS
SELECT
    p.id AS ID_Pedido,
    u.nome AS Nome_Cliente,
    p.status AS Status_Pedido,
    pr.nome AS Nome_Produto,
    ip.quantidade AS Quantidade_Comprada,
    ip.preco_unitario AS Preco_Unitario
FROM
    pedidos p
JOIN
    usuarios u ON p.cliente_id = u.id
JOIN
    itens_pedido ip ON p.id = ip.pedido_id
JOIN
    produtos pr ON ip.produto_id = pr.id;

    select * from v_pedidos_detalhados;
 
    CREATE VIEW v_clientes_sem_senha AS
SELECT
    id,
    nome,
    email,
    celular,
    criado_em
FROM
    usuarios;
    
    select * from v_clientes_sem_senha;
    
    CREATE VIEW v_resumo_estoque_baixo AS
SELECT
    p.id AS ID_Produto,
    p.nome AS Nome_Produto,
    p.estoque AS Estoque_Atual,
    p.preco AS Preco_Venda,
    c.nome AS Categoria
FROM
    produtos p
JOIN
    categorias c ON p.categoria_id = c.id
WHERE
    p.estoque < 10;
    
    select * from v_resumo_estoque_baixo;