-- Inserções em Categoria
INSERT INTO Categoria (nome) values ('Primária');
INSERT INTO Categoria (nome) values ('Secundária');

-- Inserções em TipoArma
INSERT INTO TipoArma (nome, categoria_id) values ('Fuzil de Assalto', 1);
INSERT INTO TipoArma (nome, categoria_id) values ('Submetralhadora', 1);
INSERT INTO TipoArma (nome, categoria_id) values ('Fuzil de Precisão', 1);
INSERT INTO TipoArma (nome, categoria_id) values ('Escopeta', 1);
INSERT INTO TipoArma (nome, categoria_id) values ('Pistola', 2);
INSERT INTO TipoArma (nome, categoria_id) values ('Metralhadora Leve', 1);
INSERT INTO TipoArma (nome, categoria_id) values ('Lança-granadas', 1);

-- Inserções em FabricanteArma
INSERT INTO FabricanteArma (nome) values ('Kalashnikov');
INSERT INTO FabricanteArma (nome) values ('Heckler & Koch');
INSERT INTO FabricanteArma (nome) values ('Colt');
INSERT INTO FabricanteArma (nome) values ('Barrett');
INSERT INTO FabricanteArma (nome) values ('Benelli');
INSERT INTO FabricanteArma (nome) values ('Fabrique Nationale');
INSERT INTO FabricanteArma (nome) values ('SIG Sauer');
INSERT INTO FabricanteArma (nome) values ('IMI');
INSERT INTO FabricanteArma (nome) values ('CZ');


-- Inserções em Arma
INSERT INTO Arma (nome, tipo_arma_id, fabricante_arma_id, pais_de_origem) values ('AK-47', 1, 1, 'Rússia');
INSERT INTO Arma (nome, tipo_arma_id, fabricante_arma_id, pais_de_origem) values ('MP5', 2, 2, 'Alemanha');
INSERT INTO Arma (nome, tipo_arma_id, fabricante_arma_id, pais_de_origem) values ('M1911', 4, 3, 'Estados Unidos');
INSERT INTO Arma (nome, tipo_arma_id, fabricante_arma_id, pais_de_origem) values ('Barrett .50 Cal', 3, 4, 'Estados Unidos');
INSERT INTO Arma (nome, tipo_arma_id, fabricante_arma_id, pais_de_origem) values ('Benelli M4', 5, 5, 'Itália');
INSERT INTO Arma (nome, tipo_arma_id, fabricante_arma_id, pais_de_origem) values ('M4A1', 1, 3, 'Estados Unidos');
INSERT INTO Arma (nome, tipo_arma_id, fabricante_arma_id, pais_de_origem) values ('G36C', 1, 2, 'Alemanha');
INSERT INTO Arma (nome, tipo_arma_id, fabricante_arma_id, pais_de_origem) values ('FN SCAR', 1, 6, 'Bélgica');
INSERT INTO Arma (nome, tipo_arma_id, fabricante_arma_id, pais_de_origem) values ('P226', 4, 7, 'Alemanha');
INSERT INTO Arma (nome, tipo_arma_id, fabricante_arma_id, pais_de_origem) values ('M249 SAW', 6, 6, 'Estados Unidos');
INSERT INTO Arma (nome, tipo_arma_id, fabricante_arma_id, pais_de_origem) values ('UZI', 2, 8, 'Israel');
INSERT INTO Arma (nome, tipo_arma_id, fabricante_arma_id, pais_de_origem) values ('Skorpion EVO 3', 2, 9, 'República Tcheca');


-- Inserções em Acessorio
INSERT INTO Acessorio (nome, tipo_acessorio, efeito, raridade) values ('Mira Holográfica', 'Mira', '+Precisão', 'Comum');
INSERT INTO Acessorio (nome, tipo_acessorio, efeito, raridade) values ('Silenciador', 'Cano', '-Ruído', 'Raro');
INSERT INTO Acessorio (nome, tipo_acessorio, efeito, raridade) values ('Laser', 'Mira', '+Precisão em curta distância', 'Incomum');
INSERT INTO Acessorio (nome, tipo_acessorio, efeito, raridade) values ('Carregador Ampliado', 'Carregador', '+Capacidade', 'Incomum');
INSERT INTO Acessorio (nome, tipo_acessorio, efeito, raridade) values ('Mira de Ferro', 'Mira', 'Precisão padrão', 'Comum');
INSERT INTO Acessorio (nome, tipo_acessorio, efeito, raridade) values ('Cano Longo', 'Cano', '+Alcance', 'Raro');
INSERT INTO Acessorio (nome, tipo_acessorio, efeito, raridade) values ('Coronha Retrátil', 'Coronha', '+Mobilidade', 'Incomum');


-- Inserções em ArmaAcessorio
INSERT INTO ArmaAcessorio (arma_id, acessorio_id, compativel) values (1, 1, TRUE);
INSERT INTO ArmaAcessorio (arma_id, acessorio_id, compativel) values (1, 2, TRUE);
INSERT INTO ArmaAcessorio (arma_id, acessorio_id, compativel) values (2, 3, TRUE);
INSERT INTO ArmaAcessorio (arma_id, acessorio_id, compativel) values (3, 4, FALSE);
INSERT INTO ArmaAcessorio (arma_id, acessorio_id, compativel) values (4, 5, TRUE);
INSERT INTO ArmaAcessorio (arma_id, acessorio_id, compativel) values (5, 1, TRUE);
INSERT INTO ArmaAcessorio (arma_id, acessorio_id, compativel) values (6, 3, TRUE);
INSERT INTO ArmaAcessorio (arma_id, acessorio_id, compativel) values (7, 1, FALSE);
INSERT INTO ArmaAcessorio (arma_id, acessorio_id, compativel) values (8, 2, TRUE);
INSERT INTO ArmaAcessorio (arma_id, acessorio_id, compativel) values (9, 4, TRUE);
INSERT INTO ArmaAcessorio (arma_id, acessorio_id, compativel) values (10, 1, TRUE);
INSERT INTO ArmaAcessorio (arma_id, acessorio_id, compativel) values (11, 5, FALSE);
INSERT INTO ArmaAcessorio (arma_id, acessorio_id, compativel) values (1, 3, TRUE); -- AK-47 com Laser
INSERT INTO ArmaAcessorio (arma_id, acessorio_id, compativel) values (2, 1, FALSE); -- MP5 sem Mira Holográfica
