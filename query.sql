CREATE TABLE Categoria (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(255) UNIQUE
);

CREATE TABLE TipoArma (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(255) UNIQUE,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES Categoria(id)
);

CREATE TABLE FabricanteArma (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(255) UNIQUE
);

CREATE TABLE Arma (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(255),
    tipo_arma_id INT,
    fabricante_arma_id INT,
    pais_de_origem VARCHAR(255), -- Adicionei o atributo aqui
    FOREIGN KEY (tipo_arma_id) REFERENCES TipoArma(id),
    FOREIGN KEY (fabricante_arma_id) REFERENCES FabricanteArma(id)
);

CREATE TABLE Acessorio (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(255),
    tipo_acessorio VARCHAR(255),
    efeito VARCHAR(255),
    raridade VARCHAR(255)
);

CREATE TABLE ArmaAcessorio (
    arma_id INT,
    acessorio_id INT,
    compativel BOOLEAN,
    PRIMARY KEY (arma_id, acessorio_id),
    FOREIGN KEY (arma_id) REFERENCES Arma(id),
    FOREIGN KEY (acessorio_id) REFERENCES Acessorio(id)
);
