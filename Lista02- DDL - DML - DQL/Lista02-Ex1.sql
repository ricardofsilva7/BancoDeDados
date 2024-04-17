CREATE TABLE livros (
	id_isbn serial PRIMARY KEY,
	titulo_livro text,
	editora text,
	ano_lancamento numeric
);

CREATE TABLE autores (
	id_autor serial PRIMARY KEY,
	nome_autor varchar (100)
);

CREATE TABLE livros_autores (
	id_autor int,
	id_isbn int,
	CONSTRAINT fk_autores FOREIGN KEY (id_autor) REFERENCES autores (id_autor),
	CONSTRAINT fk_livros FOREIGN KEY (id_isbn) REFERENCES livros (id_isbn)
);

INSERT INTO livros (titulo_livro, editora, ano_lancamento) VALUES
('A Marca de Athena', 'Intrínseca', '2012'),
('O Simbolo Perdido', 'Arqueiro', '2009'),
('Crepusculo','Intrínseca', '2008'),
('Codigo da Vinci','Sextante','2003'),
('O Mar Infinito', 'Fundamento','2014'),
('Jogos Vorazes','Rocco','2008'),
('Insurgnete', 'Rocco','2012'),
('O Ladrão de Raios', 'Intrínseca','2005'),
('O Hobbit','WMF Martins Fontes', '1937'),
('A Hospedeira', 'Intríseca', '2008'),
('Egito Secreto', 'Pensamento', '1997');

INSERT INTO autores (nome_autor) VALUES
('Rick Riordan'),
('Dan Brown'),
('Stephenie Meyer'),
('Rick Yancey'),
('Suzanne Collins'),
('Veronica Roth'),
('Rick Riordan'),
('J.R.R. Tolkien'),
('Paul Brunton');


-a)
SELECT * FROM livros, autores

--b)
SELECT * FROM livros INNER JOIN autores USING (id_isbn)
SELECT titulo_livro FROM livros INNER JOIN autores
ON livros.id_isbn = autores.id_autor WHERE nome_autor = 'Dan Brown'
--c)
SELECT * FROM autores INNER JOIN livros USING (id_autor)
SELECT nome_autor FROM autores INNER JOIN livros
ON autores.id_autor = livros.id_isbn  WHERE titulo_livro = 'O Simbolo Perdido'