CREATE TABLE alunos_turmas (
	id_matricula int,
	id_turma int,
	CONSTRAINT fk_alunos FOREIGN KEY (id_matricula) REFERENCES alunos (id_matricula),
	CONSTRAINT fk_turmas FOREIGN KEY (id_turma) REFERENCES turmas (id_turma)
);

CREATE TABLE turmas (
	id_turma serial PRIMARY KEY,
	id_curso int,
	CONSTRAINT fk_cursos FOREIGN KEY (id_curso) REFERENCES cursos (id_curso),
	prof_responsavel text
);

CREATE TABLE cursos (
	id_curso serial PRIMARY KEY,
	nome_curso text
);

CREATE TABLE alunos (
	id_matricula serial PRIMARY KEY,
	nome_aluno text,
	data_nascimento date
);

INSERT INTO alunos (nome_aluno, data_nascimento) VALUES
('João Silva','1990-05-15'),
('Maria Santos', '1985-11-22'),
('Pedro Oliveira', '1988-07-10'),
(' Ana Pereira', '1993-03-28'),
('Lucas Costa', '1982-09-07'),
('Juliana Almeida', '1995-12-03'),
('Rafael Fernandes', '1987-02-18'),
('Camila Souzam', '1991-06-25'),
('Gustavo Lima', '1984-04-14'),
('Larissa Santos', '1997-08-20');

INSERT INTO cursos (nome_curso) VALUES
('Desenvolvimento Web Full Stack'),
('Inteligência Artificial e Machine Learning'),
('Segurança da Informação e Ethical Hacking'),
('Ciência de Dados e Análise Estatística'),
('Cloud Computing e Arquitetura de Sistemas');

INSERT INTO turmas (prof_responsavel) VALUES
('Professora Ana Maria Oliveira'),
('Professor Marcelo Silva Santos'),
('Professora Laura Mendes Costa'),
('Professor André Ferreira Lima'),
('Professora Patrícia Rodrigues Almeida');

SELECT * FROM alunos, turmas, cursos

INSERT INTO alunos_turmas VALUES
(1,2), (2,1), (3,3), (4,1), (5,3), (6,5), (7,3), (8,5), (9,4), (10,1);


--a)
SELECT nome_aluno FROM alunos INNER JOIN turmas
ON alunos.id_matricula = turmas.id_turma WHERE prof_responsavel = 'Professora Ana Maria Oliveira'

--b)
SELECT nome_curso FROM cursos INNER JOIN alunos
ON alunos.id_matricula = cursos.id_curso WHERE id_matricula = '5'

--c)
SELECT * FROM alunos NATURAL INNER JOIN products