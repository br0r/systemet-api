from flask import jsonify, request

from systemetapi import app
from systemetapi.products import model

@app.route('/products/')
def products():
  n = request.args.get('n')
  name = request.args.get('name')
  return jsonify(products=model.getProducts(name=name, n=n))
