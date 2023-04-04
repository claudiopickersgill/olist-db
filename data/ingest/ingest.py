from sqlalchemy import create_engine
from decouple import config
import os
import pandas as pd

HOST     = config('HOST')
DATABASE = config('DATABASE')
USER     = config('USER')
PASSWORD = config('PASSWORD')
PORT     = config('PORT')

string_conexao = f'postgresql://{USER}:{PASSWORD}@{HOST}:{PORT}/{DATABASE}'
conn_olist = create_engine(string_conexao)

path = 'csv-data'
csv = os.listdir(path)

for arquivo in csv:
    df = pd.read_csv('csv-data/'+arquivo)
    if "olist" in arquivo:
        df.to_sql(arquivo.replace('_dataset.csv','').replace('olist_',''), conn_olist, if_exists='replace', index=False)