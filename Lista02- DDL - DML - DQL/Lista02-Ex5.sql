CREATE TABLE departamento (
	id_departamento serial PRIMARY KEY,
	nome_departamento text,
	id_gerente int,
	CONSTRAINT fk_funcionarios FOREING KEY (id_gerente) REFERENCES funcionarios (id_gerente)
)
