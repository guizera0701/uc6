CREATE TABLE Log_Agendamentos (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_consulta INT,
    data_log TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE TRIGGER trg_after_insert_consulta
AFTER INSERT ON Consultas
FOR EACH ROW
BEGIN
    INSERT INTO Log_Agendamentos (id_consulta)
    VALUES (NEW.id_consulta);
END$$

DELIMITER ;