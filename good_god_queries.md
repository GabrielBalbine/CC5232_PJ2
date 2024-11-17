## 1. Listar todas as armas e seus respectivos tipos

```SQL
SELECT a.nome AS nome_arma, ta.nome AS tipo_arma
FROM Arma a
JOIN TipoArma ta ON a.tipo_arma_id = ta.id;
```

## 2. Listar todas as armas de um determinado país (ex: Rússia)

```SQL
SELECT nome FROM Arma WHERE pais_de_origem = 'Rússia';
```

## 3. Listar todos os acessórios de um determinado tipo (ex: Mira)

```SQL
SELECT nome FROM Acessorio WHERE tipo_acessorio = 'Mira';
```

## 4. Listar todas as armas fabricadas por um determinado fabricante (ex: Kalashnikov)

```SQL
SELECT a.nome
FROM Arma a
JOIN FabricanteArma fa ON a.fabricante_arma_id = fa.id
WHERE fa.nome = 'Kalashnikov';
```

## 5. Listar todos os acessórios compatíveis com uma determinada arma (ex: AK-47)

```SQL
SELECT ac.nome
FROM Acessorio ac
JOIN ArmaAcessorio aa ON ac.id = aa.acessorio_id
WHERE aa.arma_id = (SELECT id FROM Arma WHERE nome = 'AK-47') AND aa.compativel = TRUE;
```

## 6. Listar todas as armas de um determinado tipo e país (ex: Fuzil de Assalto da Rússia)

```SQL
SELECT a.nome
FROM Arma a
JOIN TipoArma ta ON a.tipo_arma_id = ta.id
WHERE ta.nome = 'Fuzil de Assalto' AND a.pais_de_origem = 'Rússia';
```

## 7. Listar os tipos de acessórios mais comuns

```SQL
SELECT tipo_acessorio, COUNT(*) AS quantidade
FROM Acessorio
GROUP BY tipo_acessorio
ORDER BY quantidade DESC;
```

## 8. Listar as armas e seus acessórios, mostrando a compatibilidade

```SQL
SELECT a.nome AS nome_arma, ac.nome AS nome_acessorio, aa.compativel
FROM Arma a
JOIN ArmaAcessorio aa ON a.id = aa.arma_id
JOIN Acessorio ac ON aa.acessorio_id = ac.id;
```

## 9. Listar os fabricantes e a quantidade de armas que eles produzem

```SQL
SELECT fa.nome AS fabricante, COUNT(a.id) AS quantidade_armas
FROM FabricanteArma fa
LEFT JOIN Arma a ON fa.id = a.fabricante_arma_id
GROUP BY fa.nome;
```

## 10. Listar armas que não possuem acessórios registrados no banco de dados.
```SQL
SELECT nome FROM Arma WHERE id NOT IN (SELECT arma_id FROM ArmaAcessorio);
```
