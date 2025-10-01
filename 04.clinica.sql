SELECT c.id_consulta, m.nome AS medico, p.nome AS paciente, cl.nome AS clinica
FROM Consultas c
INNER JOIN Medicos m ON c.id_medico = m.id_medico
INNER JOIN Pacientes p ON c.id_paciente = p.id_paciente
INNER JOIN Clinicas cl ON m.id_clinica = cl.id_clinica;

SELECT m.nome, c.id_consulta
FROM Medicos m
LEFT JOIN Consultas c ON m.id_medico = c.id_medico;

SELECT nome FROM Medicos
UNION ALL
SELECT nome FROM Pacientes;