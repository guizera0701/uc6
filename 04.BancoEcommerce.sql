START TRANSACTION;

INSERT INTO pedidos (id, cliente_id, data_pedido, status, total)
VALUES (31, 1, NOW(), 'Pago', 360.00);

INSERT INTO itens_pedido (id, pedido_id, produto_id, quantidade, preco_unitario)
VALUES (31, 31, 1, 2, 180.00);

UPDATE produtos
SET estoque = estoque - 2
WHERE id = 1;

COMMIT;

START TRANSACTION;

UPDATE pedidos
SET status = 'Cancelado'
WHERE id = 31;

UPDATE produtos
SET estoque = estoque + 2
WHERE id = 1;

COMMIT;


START TRANSACTION;

UPDATE produtos
SET preco = 900.00
WHERE categoria_id = 1;

SELECT nome, preco FROM produtos WHERE categoria_id = 1;

ROLLBACK;

SELECT nome, preco FROM produtos WHERE categoria_id = 1;