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

def getStores(name=None, n=None, query=None):
  if n is None:
    n = 10

  conn = sqlite3.connect(config.DB_PATH)
  conn.row_factory = dict_factory
  c = conn.cursor()
  q = Q(T.stores).fields('*')
  if name is not None:
    q = q.where(T.stores.name.contains(name))

  if query is not None:
    q = q.where(T.stores.keywords.contains(query))

  q = compile(q[0:int(n)])
  print("Q is", q)
  c.execute(q[0], q[1])
  results = c.fetchall()
  conn.close()
  return results
