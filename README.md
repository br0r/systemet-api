# systemet-api
An API for swedish Systembolaget data

*Nothing useful here yet*


## Setting up DB from scratch

```bash
cd db
sqlite3 systemet.db < db.schema
create_db.py --products-file PRODUCTS_FILE.csv --stores-file STORES_FILE.csv
```
