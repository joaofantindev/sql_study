-- Tabela de funcionários
CREATE TABLE funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    setor VARCHAR(50),
    salario DECIMAL(10,2)
);

-- Tabela de vendas
CREATE TABLE vendas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    funcionario_id INT,
    valor DECIMAL(10,2),
    FOREIGN KEY (funcionario_id)
        REFERENCES funcionarios(id)
);


INSERT INTO funcionarios (nome, setor, salario) VALUES
('Carlos', 'TI', 3500.00),
('Mariana', 'Vendas', 2800.00),
('Roberto', 'Vendas', 3200.00),
('Ana', 'Financeiro', 4000.00),
('Pedro', 'TI', 3700.00);

INSERT INTO vendas (funcionario_id, valor) VALUES
(1, 500.00),
(1, 800.00),
(2, 1200.00),
(2, 600.00),
(3, 2000.00),
(3, 1500.00),
(4, 1.50),
(5, 300.00);
-- 8 vendas

-- ve tudo ai man
SELECT * FROM funcionarios;
SELECT * FROM vendas;

-- just sum int values in that column LEMBRA DO ESPACO NO COMENTARIO
SELECT SUM(valor) AS VENDAS_FUNCIONARIO FROM vendas WHERE funcionario_id = 1;
SELECT SUM(valor) AS total_vendas FROM vendas;
SELECT COUNT(*) AS quatidade FROM vendas;
-- count conta quantos registros tem daquele dado

-- vendas por cada funcionario
SELECT
  funcionario_id, COUNT(*) AS quantidade_vendas 
  FROM vendas
  GROUP BY funcionario_id;

SELECT
  salario, COUNT(*) AS quantidade_salarios
  FROM funcionarios
  GROUP BY salario;

SELECT *
FROM funcionarios
ORDER BY salario ASC;-- SELECT SUM(salario) AS total_salario FROM funcionarios;
-- SELECT SUM(salario) AS SALARIO_FUNC FROM funcionarios WHERE id = 2;

SELECT f.id, f.nome, COUNT(v.id) AS quantidade_vendas
FROM funcionarios f
LEFT JOIN vendas v ON v.funcionario_id = f.id
GROUP BY f.id, f.nome;
-- lembra, é só ler que da pra entender como funciona e fazer igual






