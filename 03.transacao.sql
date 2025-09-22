START TRANSACTION;

UPDATE produtos
SET preco = preco * 0.8
WHERE categoria = 'Eletrônicos';

SELECT * FROM produtos WHERE categoria = 'Eletrônicos';

ROLLBACK;