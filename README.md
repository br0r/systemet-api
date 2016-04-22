# systemet-api
An API for swedish Systembolaget data

*Nothing useful here yet*


## Setting up DB from scratch

A copy from 2016-04-23 is located inside repo.

```bash
cd db
sqlite3 systemet.db < db.schema
create_db.py --products-file PRODUCTS_FILE.csv --stores-file STORES_FILE.csv
```

## Setup

```bash
# TBD
```

Run `python3 server.js` and go to localhost:5000

## API

/products?  
n - INT number of results  
name - STRING name of product, checks both name and name_2  

/stores?  
n - INT number of results  
q - STRING search in keywords  
name - STRING name of store  
