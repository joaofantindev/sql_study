-- Categorias: uma categoria pode ter várias frutas (1:N)
CREATE TABLE CATEGORIAS (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE,
    descricao VARCHAR(200)
);

-- Frutas: cada fruta pertence a uma categoria
CREATE TABLE FRUTAS (
    id_fruta INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    poder VARCHAR(200) NOT NULL,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES CATEGORIAS(id_categoria)
);

-- Usuários: cada usuário pode ter uma fruta.
-- id_fruta UNIQUE garante que cada fruta pertença a, no máximo, um usuário.
-- Isso representa 1:1 entre usuários e frutas.
CREATE TABLE USUARIOS (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    ocupacao VARCHAR(30) NOT NULL,
    id_fruta INT UNIQUE,
    FOREIGN KEY (id_fruta) REFERENCES FRUTAS(id_fruta)
);

-- Tripulações: relação N:N com usuários
CREATE TABLE TRIPULACOES (
    id_tripulacao INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    tipo VARCHAR(30) NOT NULL
);

-- Tabela associativa: permite vários usuários por tripulação
-- e vários vínculos de tripulação por usuário.
CREATE TABLE USUARIO_TRIPULACAO (
    id_usuario INT NOT NULL,
    id_tripulacao INT NOT NULL,
    funcao VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_usuario, id_tripulacao),
    FOREIGN KEY (id_usuario) REFERENCES USUARIOS(id_usuario),
    FOREIGN KEY (id_tripulacao) REFERENCES TRIPULACOES(id_tripulacao)
);

-- 5 categorias
INSERT INTO CATEGORIAS (nome, descricao) VALUES
('Zoan', 'Permite transformar-se em animal ou criatura'),
('Logia', 'Permite criar, controlar e transformar-se em um elemento'),
('Paramecia', 'Concede habilidades especiais variadas'),
('Zoan Mítica', 'Zoan baseada em criaturas mitológicas'),
('Zoan Ancestral', 'Zoan baseada em animais pré-históricos');

-- 5 frutas, cada uma ligada a uma categoria
INSERT INTO FRUTAS (nome, poder, id_categoria) VALUES
('Hito Hito no Mi', 'Transformação em humano', 1),
('Mera Mera no Mi', 'Criar e transformar-se em fogo', 2),
('Ope Ope no Mi', 'Criar uma área para realizar operações espaciais', 3),
('Tori Tori no Mi, Modelo Fênix', 'Transformação em fênix e regeneração', 4),
('Ryu Ryu no Mi, Modelo Pteranodon', 'Transformação em pteranodonte', 5);

-- 5 usuários; cada um recebe uma fruta diferente
INSERT INTO USUARIOS (nome, ocupacao, id_fruta) VALUES
('Chopper', 'Pirata', 1),
('Sabo', 'Revolucionário', 2),
('Trafalgar Law', 'Pirata', 3),
('Marco', 'Pirata', 4),
('King', 'Pirata', 5);

-- 5 tripulações ou grupos
INSERT INTO TRIPULACOES (nome, tipo) VALUES
('Piratas do Chapéu de Palha', 'Pirata'),
('Exército Revolucionário', 'Revolucionário'),
('Piratas Heart', 'Pirata'),
('Piratas do Barba Branca', 'Pirata'),
('Piratas das Feras', 'Pirata'),
('marinheiro', 'marinha');

-- Vínculos N:N entre usuários e tripulações/grupos
INSERT INTO USUARIO_TRIPULACAO (id_usuario, id_tripulacao, funcao) VALUES
(1, 1, 'Médico'),
(2, 2, 'Chefe de gabinete'),
(3, 3, 'Capitão'),
(4, 4, 'Comandante'),
(5, 5, 'Comandante');


 -- ================== PEGANDO TODOS OS USUARIOS E FRUTAS =================
SELECT
  u.nome as usuario,
  u.ocupacao,

  f.nome as fruta_nome,
  f.poder
FROM USUARIOS u
LEFT JOIN FRUTAS f ON u.id_fruta = f.id_fruta;

-- sql nao é como algoritmo, ele analisa a query inteira, entao a gente ja faz
-- a query com os filtros e apelidos e define eles depois
 ------------------------------------------------------------------------------


