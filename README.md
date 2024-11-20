# Projeto Banco de Dados - Armas do Call of Duty

Este projeto implementa um banco de dados relacional para armazenar informações sobre armas do Call of Duty, incluindo seu nome, tipo, país de origem, acessórios, fabricante, categorias, compatibilidade.

## Integrantes do Grupo

Gabriel Balbine - R.A.: 22.222.001-4

Guilherme Albuquerque - R.A.: 22.224.024-4

Nathan Vespasiano - R.A.: 22.124.086-4

## Descrição do Projeto

O objetivo deste projeto é criar um banco de dados para armazenar informações sobre armas do Call of Duty, permitindo consultas e análises sobre as diferentes armas disponíveis no jogo.  O banco de dados inclui informações como o nome da arma, o tipo de arma (fuzil de assalto, pistola, etc.), o país de origem da arma, acessórios, dentre outras informações.

## Modelo de Dados

O modelo de dados consiste em cinco entidades principais, representando informações sobre armas, seus tipos, fabricantes, acessórios e a compatibilidade entre armas e acessórios.  As entidades e seus atributos são descritos abaixo:

* **Categoria:**
    * `id` (INT, PK): Chave primária da tabela, identificador único da categoria.
    * `nome` (VARCHAR(255)): Nome da categoria da arma (ex: "Primária", "Secundária").

* **TipoArma:**
    * `id` (INT, PK): Chave primária da tabela, identificador único do tipo de arma.
    * `nome` (VARCHAR(255)): Nome do tipo de arma (ex: "Fuzil de Assalto", "Pistola").
    * `categoria_id` (INT, FK): Chave estrangeira referenciando a tabela `Categoria`, indicando a qual categoria o tipo de arma pertence.

* **FabricanteArma:**
    * `id` (INT, PK): Chave primária da tabela, identificador único do fabricante.
    * `nome` (VARCHAR(255)): Nome do fabricante da arma (ex: "Kalashnikov", "Colt").

* **Arma:**
    * `id` (INT, PK): Chave primária da tabela, identificador único da arma.
    * `nome` (VARCHAR(255)): Nome da arma (ex: "AK-47", "M1911").
    * `tipo_arma_id` (INT, FK): Chave estrangeira referenciando a tabela `TipoArma`, indicando o tipo da arma.
    * `fabricante_arma_id` (INT, FK): Chave estrangeira referenciando a tabela `FabricanteArma`, indicando o fabricante da arma.
    * `pais_de_origem` (VARCHAR(255)): País de origem da arma.

* **Acessório:**
    * `id` (INT, PK): Chave primária da tabela, identificador único do acessório.
    * `nome` (VARCHAR(255)): Nome do acessório (ex: "Mira Holográfica", "Silenciador").
    * `tipo_acessorio` (VARCHAR(255)): Tipo do acessório (ex: "Mira", "Cano", "Coronha").
    * `efeito` (VARCHAR(255)): Efeito do acessório na arma (ex: "+Precisão", "-Recuo").
    * `raridade` (VARCHAR(255)): Raridade do acessório (ex: "Comum", "Raro", "Lendário").


* **ArmaAcessorio:** (Tabela intermediária para o relacionamento N:M entre Arma e Acessório)
    * `arma_id` (INT, FK, PK): Chave estrangeira referenciando a tabela `Arma` e parte da chave primária composta.
    * `acessorio_id` (INT, FK, PK): Chave estrangeira referenciando a tabela `Acessorio` e parte da chave primária composta.
    * `compativel` (BOOLEAN): Indica se o acessório é compatível com a arma.

## MER(Modelo de Entidade Relacional)

<img src='MER.jpg'>

## Diagrama Relacional utilizando 3NF

```mermaid
erDiagram
    TipoArma {
        int id PK
        varchar(255) nome
        int categoria_id FK
    }
    Categoria {
        int id PK
        varchar(255) nome
    }
    Arma {
        int id PK
        varchar(255) nome
        int tipo_arma_id FK
        int fabricante_arma_id FK
        varchar(255) pais_de_origem
    }
    FabricanteArma {
        int id PK
        varchar(255) nome
    }
    Acessorio {
        int id PK
        varchar(255) nome
        varchar(255) tipo_acessorio
        varchar(255) efeito
        varchar(255) raridade
    }
    ArmaAcessorio {
        int arma_id PK,FK
        int acessorio_id PK,FK
        boolean compativel
    }

    Arma ||--|| TipoArma : pertence_ao_tipo
    TipoArma ||--|| Categoria : pertence_a_categoria
    Arma ||--|| FabricanteArma : fabricado_por
    Arma ||--o{ ArmaAcessorio : pode_ter
    Acessorio }o--|| ArmaAcessorio :  e_acessorio_de
```

## Requisitos

MySQL 8.0+ (ou outro SGBD de sua escolha)

Python (recomendamos versão 3.10)

## Instalação e Execução

Crie o banco de dados: CREATE DATABASE cod_armas; (no MySQL Workbench ou terminal)

Execute o script SQL: Importe o arquivo query.sql para o seu banco de dados.

Insira os dados: Execute os comandos INSERT presentes no arquivo insert.sql. (dados base, não aleatórios)

Geração de dados aleatórios: Importe o arquivo di_geras.py e execute-o para gerar dados aleatórios para o Banco de Dados.

Consultas interessantes: Utilize como referência o arquivo good_god_queries.md para realizar algumas consultas que nós julgamos interessantes.

Consulte a seu critério: Sinta-se a vontade também para realizar outros tipos de consulta no Banco de Dados.

## Exemplos de Consultas (SQL)

-- Listar todas as armas

```SQL
SELECT * FROM Arma;
```

-- Listar armas de um tipo específico (ex: Fuzil de Assalto)

```SQL
SELECT a.nome
FROM Arma a
JOIN TipoArma ta ON a.tipo_arma_id = ta.id
WHERE ta.nome = 'Fuzil de Assalto';
```

-- Listar armas de um país específico (ex: Estados Unidos)

```SQL
SELECT nome FROM Arma WHERE pais_de_origem = 'Estados Unidos';
````


## Observações

+ Este projeto supre a uma boa parte das armas do jogo mais recente da franquia Call of Duty (Black OPS 6) e tende a ser o mais fidedigno da franquia possível. Tenha em mente que os dados gerados aleatoriamente tendem a não ter uma perpendicularidade com a realidade, então não se assuste com os resultados.

+ Estão listadas 10 queries com fatos interessantes no arquivo [good_god_queries.md](good_god_queries.md)

## Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues e pull requests.
