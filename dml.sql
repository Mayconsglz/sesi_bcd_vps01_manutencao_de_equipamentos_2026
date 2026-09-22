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