# Manutenção de Equipamentos (Tema 04)

Sistema para controle de equipamentos, histórico de manutenções, técnicos, peças e ordens de serviço em uma fábrica.

## Diagramas

### MER / DER Conceitual
![DER Conceitual](der_conceitual.png)

### MER / DER Lógico
![DER Lógico](der_logico.png)

---

## Dicionário de Dados

| Tabela | Atributo | Tipo | Descrição |
| :--- | :--- | :--- | :--- |
| **Equipamento** | id | INT  | Identificador do equipamento |
| | nome | VARCHAR | Nome da máquina |
| **Ordem_Manutencao** | id_ordem | INT  | Identificador da ordem de serviço |
| | status | VARCHAR | Status atual (Ex: Aberta, Concluída) |
| **Tecnico** | id | INT  | Identificador do técnico |
| | nome | VARCHAR | Nome do profissional |
| **Peca** | id_peca | INT  | Identificador da peça |
| | quantidade_estoque | INT | Quantidade disponível |
| **Manutencao** | id_manutencao | INT  | Detalhes da execução do serviço |
| **Peca_Manutencao** | id_manutencao / id_peca | INT  | Relação de peças usadas na manutenção |

---

## Arquivos do Projeto

*   **Dados de Teste:** [Pasta com os arquivos .CSV](data/)
*   **Script DDL:**
```

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
```
*   **Script DML:**
```

INSERT INTO Equipamento (nome, tipo, marca, modelo, numero_serie, data_aquisicao, status, setor, valor_de_aquisicao) 
VALUES ('Esteira', 'Rolante', 'Samsung', 'Naq', 'SLA12345', '2022-03-15', 'ATIVO', 'Distribuição', 150000.00),
       ('Prensa Hidráulica', 'Prensagem', 'Nissan', 'V12', 'SLA98765', '2021-07-20', 'INATIVO', 'Embalagem', 85000.00);

INSERT INTO Ordem_Manutencao (id_equipamento, tipo, descricao, data_abertura, data_inicio, data_fim, status, prioridade) 
VALUES (1, 'Preventiva', 'Troca de óleo e verificação de correias', '2026-06-01 08:00:00', '2026-06-01 09:00:00', '2026-06-01 11:30:00', 'CONCLUIDO', 'Média');

INSERT INTO Tecnico (nome, especialidade, telefone, email) 
VALUES ('Nicolas Augusto', 'Mecânica Industrial', '(11) 99999-1111', 'nicolas.augusto@fabrica.com'),
       ('Maya Lima', 'Elétrica e Automação', '(11) 77777-2222', 'maya.lima@fabrica.com');

INSERT INTO Peca (nome, descricao, quantidade_estoque, estoque_minimo, preco) 
VALUES ('Correia em V', 'Correia industrial tipo A', 15, 5, 65.50),
       ('Óleo Lubrificante 1L', 'Óleo sintético para engrenagens', 30, 10, 50.00);

INSERT INTO Manutencao (id_ordem, id_tecnico, descricao_servico, data_execucao, horas_trabalhadas, observacoes) 
VALUES (1, 1, 'Substituição do óleo e ajuste de tensão da correia.', '2026-06-01 11:30:00', 2.5, 'Equipamento liberado sem pendências.');

INSERT INTO Peca_Manutencao (id_manutencao, id_peca, quantidade) 
VALUES (1, 2, 5);

```
