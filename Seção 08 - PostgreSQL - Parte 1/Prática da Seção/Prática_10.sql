-- Criando banco de dados juncao
CREATE DATABASE IF NOT EXISTS
    juncao;

-- Criando tabela profissoes
CREATE TABLE IF NOT EXISTS profissoes
(
    id SERIAL PRIMARY KEY
  , Cargo VARCHAR(60) NOT NULL
);

-- Criando tabela clientes
CREATE TABLE IF NOT EXISTS clientes
(
    id SERIAL PRIMARY KEY
  , nome VARCHAR(60) NOT NULL
  , data_nascimento DATE NOT NULL
  , telefone VARCHAR(10) NOT NULL
  , id_profissao INT  REFERENCES profissoes(id) NOT NULL
);

-- Criando tabela consumidor
CREATE TABLE IF NOT EXISTS consumidor
(
    id SERIAL PRIMARY KEY
  , nome VARCHAR(50) NOT NULL
  , contato VARCHAR(50) NOT NULL
  , endereco VARCHAR(100) NOT NULL
  , cidade VARCHAR(100) NOT NULL
  , cep VARCHAR(20) NOT NULL
  , pais VARCHAR(50) NOT NULL
);

-- Inserindo dados na tabela profissoes
INSERT INTO profissoes
(
    cargo
) VALUES (
    'Programador'
);

INSERT INTO profissoes
(
    cargo
) VALUES (
    'Analista de Sistemas'
);

INSERT INTO profissoes
(
    cargo
) VALUES (
    'Suporte');

INSERT INTO profissoes
(
    cargo
) VALUES (
    'Gerente'
);

-- Inserindo dados na tabela clientes
INSERT INTO clientes
(
    nome
  , data_nascimento
  , telefone
  , id_profissao
) VALUES (
    'João Pereira'
  , '1981-06-15'
  , '1234-5688'
  , 1
);

INSERT INTO clientes
(
    nome
  , data_nascimento
  , telefone
  , id_profissao
) VALUES (
    'Ricardo da Silva'
  , '1973-10-10'
  , '2234-5669'
  , 2
);

INSERT INTO clientes
(
    nome
  , data_nascimento
  , telefone
  , id_profissao
) VALUES (
    'Felipe Oliveira'
  , '1987-08-01'
  , '4234-5640'
  , 3
);

INSERT INTO clientes
(
    nome
  , data_nascimento
  , telefone
  , id_profissao
) VALUES (
    'Mário Pirez'
  , '1991-02-05'
  , '5234-5621'
  , 1
);

-- Inserindo dados na tabela consumidor
INSERT INTO consumidor
(
    nome
  , contato
  , endereco
  , cidade
  , cep
  , pais
) VALUES (
    'Alfredo Nunes'
  , 'Maria Nunes'
  , 'Rua da paz, 47'
  , 'São Paulo'
  , '123.456-87'
  , 'Brasil'
);

INSERT INTO consumidor
(
    nome
  , contato
  , endereco
  , cidade
  , cep
  , pais
) VALUES (
    'Ana Trujillo'
  , 'Guilherme Souza'
  , 'Rua Dourada, 452'
  , 'Goiânia'
  , '232.984-23'
  , 'Brasil'
);

INSERT INTO consumidor
(
    nome
  , contato
  , endereco
  , cidade
  , cep
  , pais
) VALUES (
    'Leandro Veloz'
  , 'Pedro Siqueira'
  , 'Rua Vazia, 72'
  , 'São Paulo'
  , '936.738-23'
  , 'Brasil'
);

-- junção de produto cartesiano
SELECT
    c.id
  , c.nome
  , c.data_nascimento
  , c.telefone
  , p.cargo
FROM
    clientes        AS c
  , profissoes      AS p
WHERE
    c.id_profissao = p.id;

-- Inner join
SELECT
    c.id
  , c.nome
  , c.data_nascimento
  , c.telefone
  , p.cargo
FROM
    clientes        AS c
INNER JOIN
    profissoes      AS p
ON
    c.id_profissao = p.id;

-- Left outer join
SELECT
    *
FROM
    clientes        AS c
LEFT JOIN
    profissoes      AS p
ON
    c.id_profissao = p.id;

-- Right outer join
SELECT
    *
FROM
    clientes        AS c
RIGHT JOIN
    profissoes      AS p
ON
    c.id_profissao = p.id;

-- Full outer join -- Funciona no PostgreSQL mas nao funciona no MySQL
SELECT
    *
FROM
    clientes        AS c
FULL OUTER JOIN
    profissoes      AS p
ON
    c.id_profissao = p.id;

-- Cross join
SELECT
    c.id
  , c.nome
  , c.data_nascimento
  , c.telefone
  , p.cargo
FROM
    clientes        AS c
CROSS JOIN
    profissoes      AS p;

-- Self join
SELECT
    a.nome          AS Consumifor_01
  , b.nome          AS Consumidor_01
  , a.cidade
FROM
    consumidor      AS a
INNER JOIN
    consumidor      AS b
ON
    a.id <> b.id
AND
    a.cidade = b.cidade
ORDER BY
    a.cidade;