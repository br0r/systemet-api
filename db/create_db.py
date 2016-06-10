#!/usr/bin/env python3
import sys
import sqlite3
import pandas as pd
import argparse

def load_products(conn, file_name):
  df = pd.read_csv(file_name)

  columns_to_use = [u'nr', u'Artikelid', u'Namn', u'Namn2', u'Prisinklmoms',
         u'Volymiml', u'PrisPerLiter', u'Saljstart',
         u'Varugrupp', u'Forpackning', u'Ursprung',
         u'Ursprunglandnamn', u'Producent', u'Leverantor', u'Argang',
         u'Alkoholhalt', u'Sortiment', u'Ekologisk', u'Etiskt',
         u'Koscher', u'RavarorBeskrivning']

  df = df[columns_to_use]
  new_column_names = ['nr', 'id', 'name', 'name_2', 'price_vat', 'volume_in_ml', 'price_per_liter', 'sale_start', 'product_group', 'package', 'origin', 'country', 'producer', 'supplier', 'vintage_year', 'ABV', 'assortment', 'ecologic', 'ethical', 'koscher', 'raw_material_description']
  df.columns = new_column_names

  df.to_sql('products', conn, if_exists='append', index=0)

def load_stores(conn, file_name):
  df = pd.read_csv(file_name)

  columns = {u'Nr': 'id', u'Namn': 'name', u'Typ': 'type', u'Address1': 'address_1', u'Address2': 'address_2',
      u'Address3': 'address_3', u'Address4': 'address_4', u'Address5': 'address_5', u'Telefon': 'phone_number', u'Tjanster': 'services',
      u'SokOrd': 'keywords', u'Oppettider': 'opening_hours', u'RT90x': 'RT90x', u'RT90y': 'RT90y'}

  df = df[list(columns.keys())]
  df.columns = columns.values()
  df.to_sql('stores', conn, if_exists='append', index=0)


parser = argparse.ArgumentParser(description='Load systemet files into db')
parser.add_argument('-p', '--products-file', dest='products_file', help='The products file')
parser.add_argument('-s', '--stores-file', dest='stores_file', help='The stores file')

args = parser.parse_args()
conn = sqlite3.connect('systemet.db')
if (args.products_file is not None):
  load_products(conn, args.products_file)
if (args.stores_file is not None):
  load_stores(conn, args.stores_file)
sys.exit(0)
