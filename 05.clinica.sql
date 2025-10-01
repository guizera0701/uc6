SELECT m.nome, AVG(c.duracao_minutos) AS media_duracao
FROM Consultas c
INNER JOIN Medicos m ON c.id_medico = m.id_medico
GROUP BY m.id_medico;

SELECT cl.nome, DATE(c.data_consulta) AS dia, COUNT(*) AS qtd
FROM Consultas c
INNER JOIN Medicos m ON c.id_medico = m.id_medico
INNER JOIN Clinicas cl ON m.id_clinica = cl.id_clinica
GROUP BY cl.id_clinica, DATE(c.data_consulta)
HAVING COUNT(*) > 5;