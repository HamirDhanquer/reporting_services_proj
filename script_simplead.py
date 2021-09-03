#Include("venv\Lib\site-packages\faker")
from faker import Faker


texto = list()
qtosAlunos = 1000

#Função para criar o arquivo de texto. 
def create_text(qtosAlunos):
#Criação do Arquivo
    arquivo = open("simplead.sql","a")

#def create_head():
#Criação do texto
    texto.append("/*\n")
    texto.append("Author: Hamir Dhanquer\n")
    texto.append("Description: scripts sql para popular as tabelas do sistema SIMPLEEAD\n")
    texto.append("version: 0.0 \n")
    texto.append("########## REPORTING SERVICES DO BASICO AO PROJETO ##########\n")
    texto.append("*/\n")

#def create_popAluno():
    locales = 'pt_BR'
    fk = Faker(locales)
    query = " "
    x=0
    for x in range(qtosAlunos):
        nome = fk.name()
        email = fk.email()
        job = fk.job()
        query+="INSERT INTO tbl_aluno(nome,email,cargo) VALUES('"+nome+"','"+email+"','"+job+"')\n"


    texto.append("\n\n\n")
    texto.append(query)

#Criar o arquivo de Texto
    arquivo.writelines(texto)


create_text(qtosAlunos)

