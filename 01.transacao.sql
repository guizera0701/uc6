START TRANSACTION;

INSERT INTO pedidos (id, cliente_id, data_pedido, status, total)
VALUES (1001, 1, NOW(), 'Pago', 500.00);

INSERT INTO itens_pedido (id, pedido_id, produto_id, quantidade, preco_unitario)
VALUES 
  (2001, 1001, 10, 1, 200.00), -- Produto A
  (2002, 1001, 20, 1, 300.00); -- Produto B

UPDATE produtos SET estoque = estoque - 1 WHERE id = 10;
UPDATE produtos SET estoque = estoque - 1 WHERE id = 20;

COMMIT;