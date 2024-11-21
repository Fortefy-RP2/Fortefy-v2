SET search_path to fortefyschema;
INSERT INTO "usuario"("cpf", "nome", "sobrenome", "data_nasc", "email", "senha")
VALUES
('06160081632', 'Raquel', 'Olivia Melo', '1953-07-24', 'raqueloliviamelo@unimedrio.com.br', 'RWYnRh8MT3'),
('73070164609', 'Pietra', 'Bianca Figueiredo', '2006-01-20', 'pietra_bianca_figueiredo@oul.com.br', 'Rt6HZu5asc');


INSERT INTO "educador_fisico" ("cpf_educador", "local", "cref", "descricao")
VALUES
('73070164609', 'São Paulo - SP', '123456789', 'Olá, meu nome é Pietra e sou formada em EF');


INSERT INTO "treino" ("data_inicio","data_fim", "hora_inicio", "hora_fim", "nome_treino", "avaliacao_aluno", "avaliacao_ef")
VALUES
('2024-11-01', '2024-12-31', '03:00:00', '04:00:00', 'Treino de Perna', 5, 4),
('2024-11-01', '2024-12-31', '03:00:00', '04:00:00', 'Treino de Braço', 3, 2);

INSERT INTO "exercicio" ("nome_exercicio", "caminho_imagem_exercicio", "descricao_exercicio")
VALUES
('Flexão de Braço', 'flexaodebraco.jpg', 'Deite em prancha; Desça ao chão; Suba'),
('Agachamento', 'agachamento.jpg', 'Agache');

INSERT INTO "exercicios_treino"("id_treino", "id_exercicio")
VALUES
(1,2),
(2,1);

INSERT INTO "programa_treinamento" ("cpf_aluno", "cpf_ef", "id_treino", "comentario_aluno", "comentario_ef")
VALUES
('06160081632', '73070164609', 1, 'Meu dia favorito!', 'Aluna tem dificuldade nesse');


SELECT *
FROM fortefyschema.educador_fisico;

SELECT COUNT(*)
FROM fortefyschema.programa_treinamento
WHERE programa_treinamento.cpf_aluno = '06160081632';

SELECT * FROM fortefyschema.treino;
SELECT * FROM fortefyschema.exercicio;
SELECT * FROM fortefyschema.usuario;
SELECT * FROM fortefyschema.programa_treinamento;
