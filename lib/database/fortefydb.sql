-- Crie o banco e conecte nele antes de rodar
-- a criação de usuário abaixo e permissões abaixo;
CREATE DATABASE fortefydb;

-- Com o banco criado, rode esse trecho;
CREATE SCHEMA IF NOT EXISTS fortefyschema;

SET search_path to fortefyschema;

CREATE USER fortefy_app WITH ENCRYPTED PASSWORD 'fortefy_senha';
GRANT ALL PRIVILEGES ON DATABASE fortefydb to fortefy_app;
GRANT ALL ON SCHEMA fortefyschema TO fortefy_app;

-- Rode a transação abaixo inteira apenas se o restante tiver funcionado
BEGIN;
SET search_path to fortefyschema;
CREATE TABLE "usuario" (
  "cpf" char(11) PRIMARY KEY,
  "nome" varchar(100),
  "sobrenome" varchar(100),
  "data_nasc" date,
  "email" varchar(255),
  "senha" varchar(128)
);

CREATE TABLE "educador_fisico" (
  "cpf_educador" char(11) PRIMARY KEY,
  "local" varchar(100),
  "cref" char(9),
  "descricao" varchar(255)
);

CREATE TABLE "programa_treinamento" (
  "cpf_aluno" char(11),
  "cpf_ef" char(11),
  "id_treino" integer,
  "comentario_aluno" varchar(255),
  "comentario_ef" varchar(255),
  PRIMARY KEY ("cpf_aluno", "cpf_ef")
);

CREATE TABLE "treino" (
  "id" SERIAL PRIMARY KEY,
  "data_inicio" date,
  "data_fim" date,
  "hora_inicio" time,
  "hora_fim" time,
  "nome_treino" varchar(30),
  "avaliacao_aluno" integer,
  "avaliacao_ef" integer
);

CREATE TABLE "exercicio" (
  "id" serial PRIMARY KEY,
  "nome_exercicio" varchar(50),
  "caminho_imagem_exercicio" varchar(255),
  "descricao_exercicio" varchar(255)
);

CREATE TABLE "exercicios_treino" (
  "id_treino" integer PRIMARY KEY,
  "id_exercicio" integer
);

CREATE TABLE "especialidade" (
  "id" serial PRIMARY KEY,
  "nome_especialidade" varchar(50),
  "descricao_especialiadade" varchar(255)
);

CREATE TABLE "especializacao_ef" (
  "cpf_ef" char(11),
  "id_especialidade" integer
);

CREATE TABLE "mensagem" (
  "id" serial PRIMARY KEY,
  "data" date,
  "hora" time,
  "texto_mensagem" varchar(255),
  "cpf_remetente" varchar(11),
  "cpf_destinatario" varchar(11)
);

ALTER TABLE "educador_fisico" ADD FOREIGN KEY ("cpf_educador") REFERENCES "usuario" ("cpf");

ALTER TABLE "programa_treinamento" ADD FOREIGN KEY ("cpf_aluno") REFERENCES "usuario" ("cpf");

ALTER TABLE "programa_treinamento" ADD FOREIGN KEY ("cpf_ef") REFERENCES "usuario" ("cpf");

ALTER TABLE "programa_treinamento" ADD FOREIGN KEY ("id_treino") REFERENCES "treino" ("id");

ALTER TABLE "exercicios_treino" ADD FOREIGN KEY ("id_treino") REFERENCES "treino" ("id");

ALTER TABLE "exercicios_treino" ADD FOREIGN KEY ("id_exercicio") REFERENCES "exercicio" ("id");

ALTER TABLE "especializacao_ef" ADD FOREIGN KEY ("cpf_ef") REFERENCES "usuario" ("cpf");

ALTER TABLE "especializacao_ef" ADD FOREIGN KEY ("id_especialidade") REFERENCES "especialidade" ("id");

ALTER TABLE "mensagem" ADD FOREIGN KEY ("cpf_remetente") REFERENCES "usuario" ("cpf");

ALTER TABLE "mensagem" ADD FOREIGN KEY ("cpf_destinatario") REFERENCES "usuario" ("cpf");

COMMIT;
