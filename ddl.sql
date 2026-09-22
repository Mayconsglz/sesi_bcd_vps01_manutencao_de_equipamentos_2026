CREATE DATABASE manutencao_fabrica;
USE manutencao_fabrica;

CREATE TABLE Equipamento (
    id INT NOT NULL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    marca VARCHAR(10),
    modelo VARCHAR(30),
    numero_serie VARCHAR(30) UNIQUE,
    data_aquisicao DATE,
    status ENUM('ATIVO', 'INATIVO') not null default('ATIVO').
    setor VARCHAR(30) NOT NULL,
    valor_de_aquisicao DECIMAL(10,2)
);

CREATE TABLE Ordem_Manutencao (
    id_ordem INT NOT NULL PRIMARY KEY,
    id_equipamento INT NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    descricao TEXT,
    data_abertura DATETIME NOT NULL,
    data_inicio DATETIME,
    data_fim DATETIME,
    status ENUM('CONCLUIDO', 'MANUTENCAO') not null default('CONCLUIDO').
    prioridade VARCHAR(20) NOT NUL
);

CREATE TABLE Tecnico (
    id INT NOT NULL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50) NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE Peca (
    id_peca INT NOT NULL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    quantidade_estoque INT NOT NULL,
    estoque_minimo INT NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);

CREATE TABLE Manutencao (
    id_manutencao INT NOT NULL PRIMARY KEY,
    id_ordem INT NOT NULL,
    id_tecnico INT NOT NULL,
    descricao_servico TEXT,
    data_execucao DATETIME NOT NULL,
    horas_trabalhadas DECIMAL(5,2),
    observacoes TEXT
);

CREATE TABLE Peca_Manutencao (
    id_manutencao INT NOT NULL,
    id_peca INT NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (id_manutencao, id_peca)
);