import sqlite3
from sqlbuilder.smartsql import Q, T
from sqlbuilder.smartsql.compilers.sqlite import compile

from systemetapi import config

def dict_factory(cursor, row):
  d = {}
  for idx, col in enumerate(cursor.description):
    value = row[idx]
    if type(value) is str:
      value = value.strip()
    d[col[0]] = value
  return d

def getProducts(name=None, n=None):
  if n is None:
    n = 100

  conn = sqlite3.connect(config.DB_PATH)
  conn.row_factory = dict_factory
  c = conn.cursor()
  tb = T.products
  w = None
  if name is not None:
    w = (tb.name.contains(name)) | (tb.name_2.contains(name))

  q = compile(Q(tb).fields('*').where(w)[0:int(n)])
  print("Q IS", q)
  c.execute(q[0], q[1])
  results = c.fetchall()
  conn.close()
  return results
