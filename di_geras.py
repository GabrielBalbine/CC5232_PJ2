import random
import csv
import mysql.connector

# Configurações do banco de dados
mydb = mysql.connector.connect(
    host = 'localhost',
    database = 'cod_armas',
    user = 'root',
    password = 'master'
    database="mysql"
)

cursor = mydb.cursor()

# Dados de exemplo 
tipos_de_arma = ["Fuzil de Assalto", "Submetralhadora", "Fuzil de Precisão", "Escopeta", "Pistola", "Metralhadora Leve", "Lança-granadas"]
fabricantes = ["Kalashnikov", "Heckler & Koch", "Colt", "Barrett", "Benelli", "Fabrique Nationale", "SIG Sauer", "IMI", "CZ"]
paises = ["Rússia", "Alemanha", "Estados Unidos", "Itália", "Bélgica", "Israel", "República Tcheca", "Áustria", "França"]
acessorios = ["Mira Holográfica", "Silenciador", "Laser", "Empunhadura Vertical", "Carregador Ampliado", "Mira de Ferro", "Cano Longo", "Coronha Retrátil", "Bipé", "Lanterna Tática"]
tipos_acessorio = ["Mira", "Cano", "Coronha", "Carregador", "Outros"]
raridades = ["Comum", "Raro", "Lendário", "Épico", "Incomum"]
categorias = ["Primária", "Secundária"]

num_armas = 50
num_acessorios = 30



def inserir_dado(tabela, dados):
    placeholders = ", ".join(["%s"] * len(dados))
    colunas = ", ".join(dados.keys())
    sql = f"INSERT INTO {tabela} ({colunas}) VALUES ({placeholders})"
    cursor.execute(sql, list(dados.values()))



# Gerar e inserir dados para Categorias
for categoria in categorias:
    inserir_dado("Categoria", {'nome': categoria})


# Gerar e inserir dados para TipoArma
for tipo in tipos_de_arma:
    inserir_dado("TipoArma", {'nome': tipo, 'categoria_id': random.randint(1, len(categorias))})




# Gerar e inserir dados para FabricanteArma
for fabricante in fabricantes:
    inserir_dado("FabricanteArma", {'nome': fabricante})




# Gerar e inserir dados para Arma
for _ in range(num_armas):
    nome = f"Arma-{random.randint(1, 100)}"
    tipo_arma_id = random.randint(1, len(tipos_de_arma))
    fabricante_arma_id = random.randint(1, len(fabricantes))
    pais_de_origem = random.choice(paises)
    inserir_dado("Arma", {'nome': nome, 'tipo_arma_id': tipo_arma_id, 'fabricante_arma_id': fabricante_arma_id, 'pais_de_origem': pais_de_origem})




# Gerar e inserir dados para Acessorio
for _ in range(num_acessorios):
    nome = random.choice(acessorios)
    tipo = random.choice(tipos_acessorio)
    efeito = f"+{random.randint(10, 50)} {random.choice(['Dano', 'Precisão', 'Alcance'])}" if random.random() < 0.8 else f"-{random.randint(5, 25)} {random.choice(['Recuo', 'Peso'])}"
    raridade = random.choice(raridades)
    inserir_dado("Acessorio", {'nome': nome, 'tipo_acessorio': tipo, 'efeito': efeito, 'raridade': raridade})




# Gerar e inserir dados para ArmaAcessorio
for arma_id in range(1, num_armas + 1):
  num_acessorios_arma = random.randint(0, 3)  # Cada arma pode ter de 0 a 3 acessórios
  acessorios_ids = random.sample(range(1, num_acessorios + 1), num_acessorios_arma)
  for acessorio_id in acessorios_ids:
      compativel = random.random() < 0.8  # 80% de chance de ser compatível
      inserir_dado("ArmaAcessorio", {'arma_id': arma_id, 'acessorio_id': acessorio_id, 'compativel': compativel})




mydb.commit()
cursor.close()
mydb.close()

print(f"{num_armas} armas e {num_acessorios} acessórios gerados e inseridos no banco de dados.")
