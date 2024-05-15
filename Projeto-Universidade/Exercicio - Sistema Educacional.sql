*ALUNOS*
-ID ALUNO
-CPF
-NOME
-ENDEREÇO
-CONTATO (FK): Criar uma tabela somente para contato.


ATIVIDADE CLASSROM

--DDL 
--CRIANDO TABELAS

CREATE TABLE alunos (
	cpf int primary key,
	nome varchar (50),
	idade int,
	rua text,
	numero varchar (10),
	bairro varchar (20),
	cidade varchar (20),
	estado varchar (20),
	CEP int,
	pais varchar (20)
)
-- Definindo alunos formados e não formados como exemplo
ALTER TABLE alunos ADD COLUMN formado BOOLEAN;
UPDATE alunos SET formado = TRUE WHERE cpf IN ('12345678901', '23456789012', '34567890123', '56789012345', '10123456789');
UPDATE alunos SET formado = FALSE WHERE cpf IN ('67890123456', '78901234567', '89012345678', '90123456789');
ALTER TABLE alunos ALTER COLUMN cpf TYPE varchar (14)


CREATE TABLE telefones (
	ddd int,
	numero int,
	cpf varchar REFERENCES alunos
)

CREATE TABLE emails (
	email varchar (60),
	domínio varchar(30),
	cpf varchar REFERENCES alunos
)

CREATE TABLE matriculas (
	id_ra serial PRIMARY KEY,
	status varchar(20),
	id_curso int REFERENCES cursos,
	cpf varchar REFERENCES alunos
)

CREATE TABLE departamentos (
	id_dpto serial PRIMARY KEY,
	sigla_dpto varchar(5),
	nome_dpto varchar(15)
)

CREATE TABLE cursos (
	id_curso serial PRIMARY KEY,
	nome_curso varchar (12),
	id_dpto serial REFERENCES departamentos
)
ALTER TABLE cursos ALTER COLUMN nome_curso TYPE varchar(50);


CREATE TABLE disciplina (
	id_disciplina serial PRIMARY KEY,
	nome_disciplina varchar(15),
	optativa boolean
)

ALTER TABLE disciplina ALTER COLUMN nome_disciplina TYPE varchar(50);


CREATE TABLE cursos_disciplinas (
	id_curso serial REFERENCES cursos,
	id_disciplina serial REFERENCES disciplina
)
SELECT * FROM cursos
SELECT * FROM disciplina

CREATE TABLE matriculas_disciplinas (
	id_ra serial REFERENCES matriculas,
	id_disciplina serial REFERENCES disciplina
)

-- POVOANDO A TABELA -- DML --

--ALUNOS--

INSERT INTO alunos (cpf, nome, idade, rua, numero, bairro, cidade, estado, cep, pais) VALUES
(12345678901, 'João Silva', 25, 'Rua das Flores', '123', 'Centro', 'São Paulo', 'SP', 01234567, 'Brasil'),
(23456789012, 'Maria Oliveira', 22, 'Avenida dos Pássaros', '456', 'Jardim Botânico', 'Rio de Janeiro', 'RJ', 89012345, 'Brasil'),
(34567890123, 'Pedro Santos', 20, 'Rua das Árvores', '789', 'Vila Nova', 'Porto Alegre', 'RS', 23456789, 'Brasil'),
(45678901234, 'Ana Pereira', 23, 'Rua das Pedras', '101', 'Centro', 'Belo Horizonte', 'MG', 45678901, 'Brasil'),
(56789012345, 'Lucas Souza', 21, 'Avenida das Estrelas', '202', 'Jardim das Flores', 'Campinas', 'SP', 67890123, 'Brasil'),
(67890123456, 'Juliana Costa', 24, 'Rua das Margaridas', '303', 'Vila Aurora', 'Salvador', 'BA', 89012345, 'Brasil'),
(78901234567, 'Fernando Lima', 26, 'Avenida dos Girassóis', '404', 'Jardim América', 'Goiânia', 'GO', 90123456, 'Brasil'),
(89012345678, 'Amanda Santos', 22, 'Rua das Violetas', '505', 'Centro', 'Recife', 'PE', 01234567, 'Brasil'),
(90123456789, 'Rafaela Costa', 27, 'Avenida das Rosas', '606', 'Jardim Primavera', 'Curitiba', 'PR', 12345678, 'Brasil'),
(10123456789, 'Gustavo Oliveira', 25, 'Rua das Orquídeas', '707', 'Vila Nova', 'Fortaleza', 'CE', 23456789, 'Brasil');

SELECT * FROM alunos


--CONTEÚDO TELEFONES--

INSERT INTO telefones (ddd, numero, cpf) VALUES
(11, 987654321, '12345678901'),
(21, 876543210, '23456789012'),
(31, 765432109, '34567890123'),
(41, 654321098, '45678901234'),
(51, 543210987, '56789012345'),
(61, 432109876, '67890123456'),
(71, 321098765, '78901234567'),
(81, 210987654, '89012345678'),
(91, 109876543, '90123456789'),
(32, 210987654, '10123456789');

--CONTEÚDO EMAILS

INSERT INTO emails (email, domínio, cpf) VALUES
('joao.silva@gmail.com', 'gmail.com', '12345678901'),
('maria.oliveira@gmail.com', 'gmail.com', '23456789012'),
('pedro.santos@outlook.com', 'outlook.com', '34567890123'),
('ana.pereira@outlook.com', 'outlook.com', '45678901234'),
('lucas.souza@uol.com.br', 'uol.com.br', '56789012345'),
('juliana.costa@uol.com.br', 'uol.com.br', '67890123456'),
('fernando.lima@gmail.com', 'gmail.com', '78901234567'),
('amanda.santos@outlook.com', 'outlook.com', '89012345678'),
('rafaela.costa@gmail.com', 'gmail.com', '90123456789'),
('gustavo.oliveira@uol.com.br', 'uol.com.br', '10123456789');

--CONTEÚDO DEPARTAMENTO--
INSERT INTO departamentos (sigla_dpto, nome_dpto) VALUES
('ENG', 'Engenharia'),
('SAU', 'Saúde'),
('TEC', 'Tecnologia'),
('ADM', 'Administração'),
('ART', 'Artes');

SELECT * FROM departamentos

--CONTEÚDO CURSOS--

INSERT INTO cursos (nome_curso, id_dpto) VALUES
('Engenharia Civil', 1),
('Medicina', 2),
('Ciência da Computação', 3),
('Administração de Empresas', 4),
('Arquitetura', 5);

-- CONTEÚDO DISCIPLINA -- 

INSERT INTO disciplina (nome_disciplina, optativa) VALUES
('Cálculo I', false),
('Anatomia Humana', false),
('Programação I', false),
('Economia', true),
('Desenho Técnico', false),
('Álgebra Linear', false),
('Fisiologia', false),
('Estrutura de Dados', false),
('Marketing Digital', true),
('História da Arte', true);

--CONTEÚDO MATRICULAS-- 
INSERT INTO matriculas (status, id_curso, cpf) VALUES
('Ativa', 1, '12345678901'), -- Engenharia Civil, João Silva
('Ativa', 2, '23456789012'), -- Medicina, Maria Oliveira
('Ativa', 3, '34567890123'), -- Ciência da Computação, Pedro Santos
('Ativa', 4, '45678901234'), -- Administração de Empresas, Ana Pereira
('Ativa', 5, '56789012345'), -- Arquitetura, Lucas Souza
('Inativa', 1, '67890123456'), -- Engenharia Civil, Juliana Costa
('Inativa', 2, '78901234567'), -- Medicina, Fernando Lima
('Inativa', 3, '89012345678'), -- Ciência da Computação, Amanda Santos
('Inativa', 4, '90123456789'), -- Administração de Empresas, Rafaela Costa
('Inativa', 5, '10123456789'); -- Arquitetura, Gustavo Oliveira


-- CONTEÚDO CURSOS_DISCIPLINAS -- 

INSERT INTO cursos_disciplinas (id_curso, id_disciplina) VALUES
(1, 1), -- Engenharia Civil - Cálculo I
(1, 2), -- Engenharia Civil - Anatomia Humana
(1, 5), -- Engenharia Civil - Desenho Técnico
(2, 2), -- Medicina - Anatomia Humana
(2, 7), -- Medicina - Fisiologia
(3, 3), -- Ciência da Computação - Programação I
(3, 8), -- Ciência da Computação - Estrutura de Dados
(4, 4), -- Administração de Empresas - Economia
(4, 9), -- Administração de Empresas - Marketing Digital
(5, 5), -- Arquitetura - Desenho Técnico
(5, 10); -- Arquitetura - História da Arte

-- CONTEÚDO MATRICULAS_DISCIPLINAS -- 

INSERT INTO matriculas_disciplinas (id_ra, id_disciplina) VALUES
(1, 1), -- Matrícula de João Silva na disciplina Cálculo I
(1, 2), -- Matrícula de João Silva na disciplina Anatomia Humana
(2, 2), -- Matrícula de Maria Oliveira na disciplina Anatomia Humana
(3, 3), -- Matrícula de Pedro Santos na disciplina Programação I
(4, 4), -- Matrícula de Ana Pereira na disciplina Economia
(5, 5), -- Matrícula de Lucas Souza na disciplina Desenho Técnico
(6, 6), -- Matrícula de Juliana Costa na disciplina Álgebra Linear
(7, 7), -- Matrícula de Fernando Lima na disciplina Fisiologia
(8, 8), -- Matrícula de Amanda Santos na disciplina Estrutura de Dados
(9, 9), -- Matrícula de Rafaela Costa na disciplina Marketing Digital
(10, 10); -- Matrícula de Gustavo Oliveira na disciplina História da Arte

             -- DQL --

-- 1. Dado o RA ou o Nome do Aluno, buscar no BD todos os demais dados do aluno.
SELECT * FROM alunos WHERE nome = 'Pedro Santos';

-- 2. Dado o nome de um departamento, exibir o nome de todos os cursos associados a ele.
SELECT cursos.nome_curso 
FROM cursos 
JOIN departamentos ON cursos.id_dpto = departamentos.id_dpto 
WHERE departamentos.nome_dpto = 'Engenharia';

-- 3. Dado o nome de uma disciplina, exibir a qual ou quais cursos ela pertence.
--REVER DEPOIS
SELECT cursos.nome_curso 
FROM cursos 
JOIN cursos_disciplinas ON cursos.id_curso = cursos_disciplinas.id_curso 
JOIN disciplina ON cursos_disciplinas.id_disciplina = disciplina.id_disciplina 
WHERE disciplina.nome_disciplina = 'Medicina';

-- 4. Dado o CPF de um aluno, exibir quais disciplinas ele está cursando.
SELECT disciplina.nome_disciplina 
FROM disciplina 
JOIN matriculas_disciplinas ON disciplina.id_disciplina = matriculas_disciplinas.id_disciplina 
JOIN matriculas ON matriculas_disciplinas.id_ra = matriculas.id_ra 
WHERE matriculas.cpf = '89012345678';

-- 5. Filtrar todos os alunos matriculados em um determinado curso.
SELECT alunos.* 
FROM alunos 
JOIN matriculas ON alunos.cpf = matriculas.cpf 
JOIN cursos ON matriculas.id_curso = cursos.id_curso 
WHERE cursos.nome_curso = 'Engenharia Civil';

-- 6. Filtrar todos os alunos matriculados em determinada disciplina.
SELECT alunos.* 
FROM alunos 
JOIN matriculas ON alunos.cpf = matriculas.cpf 
JOIN matriculas_disciplinas ON matriculas.id_ra = matriculas_disciplinas.id_ra 
JOIN disciplina ON matriculas_disciplinas.id_disciplina = disciplina.id_disciplina 
WHERE disciplina.nome_disciplina = 'Programação I';

-- 7. 
SELECT * FROM alunos WHERE formado = TRUE;



-- 8. Filtrar alunos ativos.
SELECT * FROM alunos WHERE cpf IN (SELECT cpf FROM matriculas WHERE status = 'Ativa');

-- 9. Apresentar a quantidade de alunos ativos por curso
SELECT cursos.nome_curso, COUNT(alunos.cpf) AS quantidade_alunos_ativos 
FROM cursos 
JOIN matriculas ON cursos.id_curso = matriculas.id_curso 
JOIN alunos ON matriculas.cpf = alunos.cpf 
WHERE matriculas.status = 'Ativa' 
GROUP BY cursos.nome_curso;

-- 10. Apresentar a quantidade de alunos ativos por disciplina.
SELECT disciplina.nome_disciplina, COUNT(alunos.cpf) AS quantidade_alunos_ativos 
FROM disciplina 
JOIN matriculas_disciplinas ON disciplina.id_disciplina = matriculas_disciplinas.id_disciplina 
JOIN matriculas ON matriculas_disciplinas.id_ra = matriculas.id_ra 
JOIN alunos ON matriculas.cpf = alunos.cpf 
WHERE matriculas.status = 'Ativa' 
GROUP BY disciplina.nome_disciplina;


