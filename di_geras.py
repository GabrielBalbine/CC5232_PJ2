import random
import csv
import mysql.connector

# Configurações do banco de dados
mydb = mysql.connector.connect(
    host="seu_host",
    user="seu_usuario",
    password="sua_senha",
    database="nome_do_seu_banco_de_dados"
)
cursor = mydb.cursor()

# Dados de exemplo (expanda conforme necessário)
tipos_de_arma = ["Fuzil de Assalto", "Submetralhadora", "Fuzil de Precisão", "Escopeta", "Pistola", "Metralhadora Leve", "Lança-granadas"]
fabricantes = ["Kalashnikov", "Heckler & Koch", "Colt", "Barrett", "Benelli", "Fabrique Nationale", "SIG Sauer", "IMI", "CZ"]
paises = ["Rússia", "Alemanha", "Estados Unidos", "Itália", "Bélgica", "Israel", "República Tcheca", "Áustria", "França"]
acessorios = ["Mira Holográfica", "Silenciador", "Laser", "Empunhadura Vertical", "Carregador Ampliado", "Mira de Ferro", "Cano Longo", "Coronha Retrátil", "Bipé", "Lanterna Tática"]
tipos_acessorio = ["Mira", "Cano", "Coronha", "Carregador", "Outros"]
raridades = ["Comum", "Raro", "Lendário", "Épico", "Incomum"]
categorias = ["Primária", "Secundária"]

num_armas = 50
num_acessorios = 30

def inserir_dados(tabela, dados):
    colunas = ", ".join(dados.keys())
    placeholders = ", ".join(["%s"] * len(dados))
    sql = f"INSERT INTO {tabela} ({colunas}) VALUES ({placeholders})"
    cursor.execute(sql, list(dados.values()))

try:
    cursor.execute("DELETE FROM ArmaAcessorio")
    cursor.execute("DELETE FROM Acessorio")
    cursor.execute("DELETE FROM Arma")
    cursor.execute("DELETE FROM FabricanteArma")
    cursor.execute("DELETE FROM TipoArma")
    cursor.execute("DELETE FROM Categoria")
    mydb.commit()

    for categoria in categorias:
        inserir_dados("Categoria", {'nome': categoria})

    for tipo in tipos_de_arma:
        inserir_dados("TipoArma", {'nome': tipo, 'categoria_id': random.randint(1, len(categorias))})

    for fabricante in fabricantes:
        inserir_dados("FabricanteArma", {'nome': fabricante})

    for _ in range(num_armas):
        nome = f"Arma-{random.randint(1, 100)}"
        tipo_arma_id = random.randint(1, len(tipos_de_arma))
        fabricante_arma_id = random.randint(1, len(fabricantes))
        pais_de_origem = random.choice(paises)
        inserir_dados("Arma", {'nome': nome, 'tipo_arma_id': tipo_arma_id, 'fabricante_arma_id': fabricante_arma_id, 'pais_de_origem': pais_de_origem})

    for _ in range(num_acessorios):
        nome = random.choice(acessorios)
        tipo = random.choice(tipos_acessorio)
        efeito = f"+{random.randint(10, 50)} {random.choice(['Dano', 'Precisão', 'Alcance'])}" if random.random() < 0.8 else f"-{random.randint(5, 25)} {random.choice(['Recuo', 'Peso'])}"
        raridade = random.choice(raridades)
        inserir_dados("Acessorio", {'nome': nome, 'tipo_acessorio': tipo, 'efeito': efeito, 'raridade': raridade})

    for arma_id in range(1, num_armas + 1):
        acessorios_adicionados = set()
        num_acessorios_arma = random.randint(0, 3)
        for _ in range(num_acessorios_arma):
            acessorio_id = random.randint(1, num_acessorios)
            if acessorio_id not in acessorios_adicionados:
                compativel = random.random() < 0.8
                inserir_dados("ArmaAcessorio", {'arma_id': arma_id, 'acessorio_id': acessorio_id, 'compativel': compativel})
                acessorios_adicionados.add(acessorio_id)

    mydb.commit()
    print(f"{num_armas} armas e {num_acessorios} acessórios gerados e inseridos no banco de dados.")

except mysql.connector.Error as err:
    print(f"Erro: {err}")
    mydb.rollback()
finally:
    cursor.close()
    mydb.close()
