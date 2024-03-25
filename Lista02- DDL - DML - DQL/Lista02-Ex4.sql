CREATE TABLE pacientes (
	id_paciente serial PRIMARY KEY,
	nome_paciente text,
	data_nascimento text
)

CREATE TABLE medicos (
	id_medico serial PRIMARY KEY,
	nome_medico text,
	especializacao text
)

CREATE TABLE registros (
	id_registro serial PRIMARY KEY,
	data_registro date,
	id_medico int,
	id_paciente int,
	CONSTRAINT fk_pacientes FOREIGN KEY (id_paciente) REFERENCES pacientes (id_paciente),
	CONSTRAINT fk_medicos FOREING KEY (id_medico) REFERENCES medicos (id_medico)
)

INSERT INTO pacientes (nome_paciente, data_nascimento) VALUES
('Maria da Silva','1990-03-15'),
('José Oliveira','1985-07-22'),
('Ana Santos','1992-11-10'),
('Pedro Costa','1988-05-28'),
('João Pereira','1983-09-07'),
('Camila Almeida','1995-02-18'),
('Lucas Fernandes','1987-06-30'),
('Juliana Lima','1991-04-14'),
('Rafael Souza','1989-08-20'),
('Larissa Rodrigues','1997-12-03');

INSERT INTO medicos (nome_medico, especializacao) VALUES
('Dr. Carlos Mendes','Cardiologia'),
('Dra. Ana Costa','Ortopedia'),
('Dr. Pedro Oliveira','Pediatria'),
('Dra. Juliana Santos','Ginecologia'),
('Dr. Lucas Almeida','Psiquiatria'),
('Dr. Armando Ribeiro','Clínico Geral');

SELECT * FROM medicos