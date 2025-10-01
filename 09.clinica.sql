DELIMITER $$

CREATE PROCEDURE AgendarConsulta(
    IN p_id_medico INT,
    IN p_id_paciente INT,
    IN p_data DATETIME,
    IN p_duracao INT
)
BEGIN
    DECLARE conflito INT;

    START TRANSACTION;

    SELECT COUNT(*) INTO conflito
    FROM Consultas
    WHERE id_medico = p_id_medico
      AND data_consulta = p_data;

    IF conflito > 0 THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Horário indisponível para este médico';
    ELSE
        INSERT INTO Consultas (id_medico, id_paciente, data_consulta, duracao_minutos)
        VALUES (p_id_medico, p_id_paciente, p_data, p_duracao);
        COMMIT;
    END IF;
END$$

DELIMITER ;