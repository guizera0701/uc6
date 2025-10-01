
CREATE DATABASE sistema_clinica
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE sistema_clinica;

CREATE TABLE Clinicas (
    id_clinica INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Especialidades (
    id_especialidade INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Medicos (
    id_medico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    crm VARCHAR(20) NOT NULL UNIQUE,
    id_especialidade INT NOT NULL,
    id_clinica INT NOT NULL,
    FOREIGN KEY (id_especialidade) REFERENCES Especialidades(id_especialidade)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (id_clinica) REFERENCES Clinicas(id_clinica)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Pacientes (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    telefone VARCHAR(20)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Consultas (
    id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    id_medico INT NOT NULL,
    id_paciente INT NOT NULL,
    data_consulta DATETIME NOT NULL,
    duracao_minutos INT NOT NULL,
    FOREIGN KEY (id_medico) REFERENCES Medicos(id_medico)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
