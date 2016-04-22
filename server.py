import os
from flask import jsonify

from systemetapi import app
from systemetapi import config

@app.route("/")
def index():
  return jsonify(version=config.VERSION, status='ok')

if __name__ == "__main__":
  app.run(debug=True)
