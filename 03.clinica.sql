SELECT nome, data_nascimento, cidade
FROM Pacientes
WHERE data_nascimento > '2000-01-01'
  AND cidade = 'São Paulo'
ORDER BY data_nascimento ASC
LIMIT 20;