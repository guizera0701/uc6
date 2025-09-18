create database SistemaCliente;

use SistemaCliente;

CREATE TABLE clientes (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

select * from clientes;