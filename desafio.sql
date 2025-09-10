create database desafio;
use desafio;


CREATE TABLE cliente (
    id INT,
    nome VARCHAR(200),
    email VARCHAR(225),
    senha VARCHAR(25),
    celular VARCHAR(20),
    cpf VARCHAR(15),
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP
); 

CREATE TABLE enderecos (
    id_enderecos INT,
    cliente_id INT,
    rua VARCHAR(100),
    numero INT,
    bairro VARCHAR(100),
    cidade VARCHAR(80),
    estado VARCHAR(70),
    cep VARCHAR(10)
); 

CREATE TABLE categorias (
    id_categorias INT,
    nome VARCHAR(25),
    descricao VARCHAR(100)
);

CREATE TABLE produtos (
    id_produtos INT,
    nome VARCHAR(100),
    descricao VARCHAR(200),
    preco VARCHAR(10),
    estoque INT,
    categoria_id INT
); 

CREATE TABLE pedidos (
    id_pedidos INT,
    cliente_id INT,
    data_pedido DATE,
    status_pedido ENUM('cancelado', 'pago', 'enviado', 'pendente'),
    total VARCHAR(20)
); 

CREATE TABLE itens_pedidos (
    id_itens_pedidos INT,
    pedido_id INT,
    produtos_id INT,
    quantidade INT,
    preco_unitario VARCHAR(10)
); 