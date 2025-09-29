DELIMITER //

CREATE TRIGGER trg_baixa_estoque
AFTER INSERT ON itens_pedido
FOR EACH ROW
BEGIN
    UPDATE produtos
    SET estoque = estoque - NEW.quantidade
    WHERE id = NEW.produto_id;
END //

DELIMITER ;

CREATE TABLE IF NOT EXISTS log_status_pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    status_antigo VARCHAR(50),
    status_novo VARCHAR(50),
    data_mudanca TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER trg_log_status_pedido
BEFORE UPDATE ON pedidos
FOR EACH ROW
BEGIN
    IF OLD.status <> NEW.status THEN
        INSERT INTO log_status_pedidos (
            pedido_id,
            status_antigo,
            status_novo
        )
        VALUES (
            OLD.id,
            OLD.status,
            NEW.status
        );
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER trg_validacao_cliente
BEFORE INSERT ON usuarios
FOR EACH ROW
BEGIN
    SET NEW.nome = UPPER(NEW.nome);

    IF NEW.cpf IS NULL OR NEW.cpf = '' THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'ERRO: O CPF do usuário não pode ser nulo ou vazio.';
    END IF;
END //

DELIMITER ;

DROP TRIGGER IF EXISTS trg_baixa_estoque;

DROP TRIGGER IF EXISTS trg_log_status_pedido;

DROP TRIGGER IF EXISTS trg_validacao_cliente;