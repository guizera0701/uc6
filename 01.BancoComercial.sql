CREATE DATABASE BancoComercial
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;

USE BancoComercial;

CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    cidade VARCHAR(100),
    telefone VARCHAR(20)
) ENGINE=InnoDB;

CREATE TABLE Vendedores (
    id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    matricula VARCHAR(20) NOT NULL UNIQUE,
    telefone VARCHAR(20)
) ENGINE=InnoDB;

CREATE TABLE Produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(200) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL DEFAULT 0
) ENGINE=InnoDB;

CREATE TABLE Pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_vendedor INT NOT NULL,
    data_pedido DATE NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Itens_Pedido (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL
) ENGINE=InnoDB;

ALTER TABLE Pedidos
ADD CONSTRAINT fk_pedidos_clientes
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Pedidos
ADD CONSTRAINT fk_pedidos_vendedores
    FOREIGN KEY (id_vendedor) REFERENCES Vendedores(id_vendedor)
    ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE Itens_Pedido
ADD CONSTRAINT fk_itens_pedido_pedidos
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Itens_Pedido
ADD CONSTRAINT fk_itens_pedido_produtos
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
    ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE Clientes
ADD COLUMN email VARCHAR(150) UNIQUE;
