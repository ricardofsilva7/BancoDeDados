INSERT INTO funcProjetos VALUES
(1,2), (2,1), (3,3), (4,1), (5,3), (6,5), (7,8);


--a)
SELECT funcionarios.nome_func, projetos.nome_projeto
FROM (projetos NATURAL INNER JOIN funcProjetos)
INNER JOIN funcionarios USING (id_funcionario)
WHERE projetos.nome_projeto = 'Monitoramento de Fitness'