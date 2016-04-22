from flask import jsonify, request

from systemetapi import app
from systemetapi.stores import model

@app.route('/stores/')
def stores():
  n = request.args.get('n')
  name = request.args.get('name')
  query = request.args.get('q')
  args = {'n': n, 'name': name, 'query': query}
  return jsonify(stores=model.getStores(**args))
