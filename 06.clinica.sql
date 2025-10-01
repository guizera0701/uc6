CREATE OR REPLACE VIEW ConsultasUltimoMes AS
SELECT * FROM Consultas
WHERE data_consulta >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

SELECT p.nome
FROM Pacientes p
WHERE p.id_paciente IN (
    SELECT c.id_paciente
    FROM Consultas c
    INNER JOIN Medicos m ON c.id_medico = m.id_medico
    GROUP BY c.id_paciente
    HAVING COUNT(DISTINCT m.id_especialidade) >= 2
);