--a)
SELECT * FROM livros, autores

--b)
SELECT * FROM livros INNER JOIN autores USING (id_isbn)
SELECT titulo_livro FROM livros INNER JOIN autores
ON livros.id_isbn = autores.id_autor WHERE nome_autor = 'Dan Brown'
SELECT nome_autor FROM autores INNER JOIN livros
ON livros.id_isbn = autores.id_autor WHERE nome_autor = 'Dan Brown'
--c)
SELECT * FROM autores INNER JOIN livros USING (id_autor)
SELECT nome_autor FROM autores INNER JOIN livros
ON livros.id_isbn = autores.id_autor WHERE titulo_livro = 'O Simbolo Perdido'