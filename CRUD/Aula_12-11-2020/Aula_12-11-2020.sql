CREATE DATABASE Aula_12_11_2020 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE Aula_12_11_2020;

CREATE TABLE participantes(
	id_participante INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    rm INT UNIQUE NOT NULL,
    nome VARCHAR(191) NOT NULL,
    data_nascimento DATE,
    genero CHAR(1) NOT NULL,
    serie VARCHAR(191) NOT NULL,
    curso VARCHAR(191) NOT NULL
);

CREATE TABLE equipes(
	id_equipe INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(191) NOT NULL,
    logotipo VARCHAR(191) NOT NULL,
    jogo VARCHAR(191) NOT NULL
);

CREATE TABLE participantes_equipes(
	id_participante_equipe INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    participante_id INT UNSIGNED NOT NULL,
    equipe_id INT UNSIGNED NOT NULL
);

ALTER TABLE participantes_equipes ADD CONSTRAINT fk_participante FOREIGN KEY (participante_id) REFERENCES participantes (id_participante);

ALTER TABLE participantes_equipes ADD CONSTRAINT fk_equipe FOREIGN KEY (equipe_id) REFERENCES equipes (id_equipe);

ALTER TABLE equipes
	ADD posicao_final VARCHAR(191) NOT NULL;

INSERT INTO participantes (rm, nome, data_nascimento, genero, serie, curso)
	VALUES (1, 'Gabriel', '2004-11-10', 'M', 'Primeiro ano', 'Desenvolvimento de Sistemas'),
    (2, 'Jônatas', '2004-10-09', 'M', 'Primeiro ano', 'Desenvolvimento de Sistemas'),
    (3, 'André', '2005-02-06', 'M', 'Primeiro ano', 'Desenvolvimento de Sistemas'),
    (4, 'Carlinhos', '2004-12-19', 'M', 'Segundo ano', 'Marcenaria'),
    (5, 'Luiz Davilla', '2000-12-24', 'M', 'Terceiro ano', 'Administração'),
    (6, 'Ronan', '1988-02-25', 'M', 'Terceiro Ano', 'Informática'),
    (7, 'Luis Fernando', '1758-06-24', 'M', 'Segundo Ano', 'Desenvolvimento de Sistemas'),
    (8, 'Bidu', '1968-03-26', 'M', 'Primeiro Ano', 'Informática'),
    (9, 'Sidney', '1969-12-12', 'M', 'Terceiro Ano', 'Marketing'),
    (10, 'Tiago Fagundes', '1987-02-28', 'M', 'Primeiro Ano', 'Marcenaria');

INSERT INTO equipes (nome, logotipo, jogo, posicao_final)
	VALUES ('Os Tiozões', 'Tiozoes.jpg', 'CS:GO', 'Segundo lugar'),
    ('Os Algoritmos', 'Algoritmos.png', 'CS:GO', 'Pirmeiro Lugar');
    
INSERT INTO participantes_equipes (participante_id, equipe_id)
	VALUES (1, 2),
    (2, 2),
    (3, 2),
    (4, 2),
    (5, 2),
    (6, 1),
    (7, 1),
    (8, 1),
    (9, 1),
    (10, 1);
    
SHOW TABLES;
    
SELECT * FROM participantes;

SELECT * FROM equipes;

SELECT * FROM participantes_equipes;

UPDATE participantes
	SET nome = 'Osmar'
    WHERE id_participante = 4;
    
DELETE FROM participantes
	WHERE id_participante = 5;
    
SELECT nome FROM participantes  WHERE id_participante >= 6;