-- Inserções em Categoria
INSERT INTO Categoria (nome) VALUES ('Primária');
INSERT INTO Categoria (nome) VALUES ('Secundária');

-- Inserções em TipoArma
INSERT INTO TipoArma (nome, categoria_id) VALUES ('Fuzil de Assalto', 1);
INSERT INTO TipoArma (nome, categoria_id) VALUES ('Submetralhadora', 1);
INSERT INTO TipoArma (nome, categoria_id) VALUES ('Fuzil de Precisão', 1);
INSERT INTO TipoArma (nome, categoria_id) VALUES ('Escopeta', 1);
INSERT INTO TipoArma (nome, categoria_id) VALUES ('Pistola', 2);
INSERT INTO TipoArma (nome, categoria_id) VALUES ('Metralhadora Leve', 1);
INSERT INTO TipoArma (nome, categoria_id) VALUES ('Lança-granadas', 1);

-- Inserções em FabricanteArma
INSERT INTO FabricanteArma (nome) VALUES ('Kalashnikov');
INSERT INTO FabricanteArma (nome) VALUES ('Heckler & Koch');
INSERT INTO FabricanteArma (nome) VALUES ('Colt');
INSERT INTO FabricanteArma (nome) VALUES ('Barrett');
INSERT INTO FabricanteArma (nome) VALUES ('Benelli');
INSERT INTO FabricanteArma (nome) VALUES ('Fabrique Nationale');
INSERT INTO FabricanteArma (nome) VALUES ('SIG Sauer');
INSERT INTO FabricanteArma (nome) VALUES ('IMI');
INSERT INTO FabricanteArma (nome) VALUES ('CZ');


-- Inserções em Arma
INSERT INTO Arma (nome, tipo_arma_id, fabricante_arma_id, pais_de_origem) VALUES ('AK-47', 1, 1, 'Rússia');
INSERT INTO Arma (nome, tipo_arma_id, fabricante_arma_id, pais_de_origem) VALUES ('MP5', 2, 2, 'Alemanha');
INSERT INTO Arma (nome, tipo_arma_id, fabricante_arma_id, pais_de_origem) VALUES ('M1911', 4, 3, 'Estados Unidos');
INSERT INTO Arma (nome, tipo_arma_id, fabricante_arma_id, pais_de_origem) VALUES ('Barrett .50 Cal', 3, 4, 'Estados Unidos');
INSERT INTO Arma (nome, tipo_arma_id, fabricante_arma_id, pais_de_origem) VALUES ('Benelli M4', 5, 5, 'Itália');
INSERT INTO Arma (nome, tipo_arma_id, fabricante_arma_id, pais_de_origem) VALUES ('M4A1', 1, 3, 'Estados Unidos');
INSERT INTO Arma (nome, tipo_arma_id, fabricante_arma_id, pais_de_origem) VALUES ('G36C', 1, 2, 'Alemanha');
INSERT INTO Arma (nome, tipo_arma_id, fabricante_arma_id, pais_de_origem) VALUES ('FN SCAR', 1, 6, 'Bélgica');
INSERT INTO Arma (nome, tipo_arma_id, fabricante_arma_id, pais_de_origem) VALUES ('P226', 4, 7, 'Alemanha');
INSERT INTO Arma (nome, tipo_arma_id, fabricante_arma_id, pais_de_origem) VALUES ('M249 SAW', 6, 6, 'Estados Unidos');
INSERT INTO Arma (nome, tipo_arma_id, fabricante_arma_id, pais_de_origem) VALUES ('UZI', 2, 8, 'Israel');
INSERT INTO Arma (nome, tipo_arma_id, fabricante_arma_id, pais_de_origem) VALUES ('Skorpion EVO 3', 2, 9, 'República Tcheca');


-- Inserções em Acessorio
INSERT INTO Acessorio (nome, tipo_acessorio, efeito, raridade) VALUES ('Mira Holográfica', 'Mira', '+Precisão', 'Comum');
INSERT INTO Acessorio (nome, tipo_acessorio, efeito, raridade) VALUES ('Silenciador', 'Cano', '-Ruído', 'Raro');
INSERT INTO Acessorio (nome, tipo_acessorio, efeito, raridade) VALUES ('Laser', 'Mira', '+Precisão em curta distância', 'Incomum');
INSERT INTO Acessorio (nome, tipo_acessorio, efeito, raridade) VALUES ('Carregador Ampliado', 'Carregador', '+Capacidade', 'Incomum');
INSERT INTO Acessorio (nome, tipo_acessorio, efeito, raridade) VALUES ('Mira de Ferro', 'Mira', 'Precisão padrão', 'Comum');
INSERT INTO Acessorio (nome, tipo_acessorio, efeito, raridade) VALUES ('Cano Longo', 'Cano', '+Alcance', 'Raro');
INSERT INTO Acessorio (nome, tipo_acessorio, efeito, raridade) VALUES ('Coronha Retrátil', 'Coronha', '+Mobilidade', 'Incomum');


-- Inserções em ArmaAcessorio
INSERT INTO ArmaAcessorio (arma_id, acessorio_id, compativel) VALUES (1, 1, TRUE);
INSERT INTO ArmaAcessorio (arma_id, acessorio_id, compativel) VALUES (1, 2, TRUE);
INSERT INTO ArmaAcessorio (arma_id, acessorio_id, compativel) VALUES (2, 3, TRUE);
INSERT INTO ArmaAcessorio (arma_id, acessorio_id, compativel) VALUES (3, 4, FALSE);
INSERT INTO ArmaAcessorio (arma_id, acessorio_id, compativel) VALUES (4, 5, TRUE);
INSERT INTO ArmaAcessorio (arma_id, acessorio_id, compativel) VALUES (5, 1, TRUE);
INSERT INTO ArmaAcessorio (arma_id, acessorio_id, compativel) VALUES (6, 3, TRUE);
INSERT INTO ArmaAcessorio (arma_id, acessorio_id, compativel) VALUES (7, 1, FALSE);
INSERT INTO ArmaAcessorio (arma_id, acessorio_id, compativel) VALUES (8, 2, TRUE);
INSERT INTO ArmaAcessorio (arma_id, acessorio_id, compativel) VALUES (9, 4, TRUE);
INSERT INTO ArmaAcessorio (arma_id, acessorio_id, compativel) VALUES (10, 1, TRUE);
INSERT INTO ArmaAcessorio (arma_id, acessorio_id, compativel) VALUES (11, 5, FALSE);
INSERT INTO ArmaAcessorio (arma_id, acessorio_id, compativel) VALUES (1, 3, TRUE); -- AK-47 com Laser
INSERT INTO ArmaAcessorio (arma_id, acessorio_id, compativel) VALUES (2, 1, FALSE); -- MP5 sem Mira Holográfica
