INSERT INTO projetos (nome_projeto, descricao) VALUES
('Gerenciamento Escolar Online', 'Plataforma para facilitar matrículas, controle de notas e comunicação escolar.'),
('E-commerce Sustentável','Plataforma de comércio eletrônico para produtos ecologicamente corretos.'),
('Aplicativo de Saúde Mental','Aplicativo móvel com recursos para apoio à saúde mental.'),
('Gestão de Estoque para PMEs',' Sistema de gestão de estoque adaptado para pequenas empresas.'),
('Aprendizado Online Interativo','Plataforma digital com cursos interativos em diversos temas.'),
('Monitoramento de Fitness',' Aplicativo móvel para rastrear atividades físicas e fornecer planos de exercícios.'),
('Gestão de Projetos Ágeis','Sistema para planejamento e execução eficiente de projetos de software.'),
('Compartilhamento de Caronas','Plataforma online para conectar motoristas e passageiros.'),
('Gerenciamento Financeiro Pessoal',' Aplicativo móvel para controle de finanças pessoais'),
('Reservas de Eventos Online','Sistema de reservas online para eventos e ingressos.');

INSERT INTO funcionarios (nome_func, data_admissao) VALUES
('João da Silva',' 2022-01-10'),
('Ana Oliveira','2021-11-05'),
('Pedro Santos',' 2023-03-15'),
('Maria Costa','2022-09-20'),
('Carlos Pereira',' 2023-01-08'),
(' Juliana Fernandes','2021-07-03'),
(' Rafael Lima',' 2022-05-12'),
('Camila Souza','2023-02-28'),
('Lucas Almeida','2021-04-17'),
('Larissa Rodrigues','2022-08-25');

INSERT INTO funcProjetos VALUES
(1,2), (2,1), (3,3), (4,1), (5,3), (6,5), (7,8);


--a)
SELECT funcionarios.nome_func, projetos.nome_projeto
FROM (projetos NATURAL INNER JOIN funcProjetos)
INNER JOIN funcionarios USING (id_funcionario)
WHERE projetos.nome_projeto = 'Monitoramento de Fitness'

--b)
SELECT funcionarios.nome_func, projetos.nome_projeto
FROM (funcionarios NATURAL INNER JOIN funcProjetos)
INNER JOIN projetos USING (id_projeto)
WHERE funcionarios.nome_func = 'João da Silva'

--c)
