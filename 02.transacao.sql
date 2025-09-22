START TRANSACTION;

UPDATE produtos
SET estoque = estoque + 50
WHERE id = 30;

INSERT INTO auditoria_estoque (produto_id, data_alteracao, alteracao, usuario)
VALUES (30, NOW(), 'Entrada de 50 unidades', 'admin');

COMMIT;