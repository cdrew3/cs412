import pprint
import sqlite3

db = sqlite3.connect(':memory:')

def init_db(cur):
    cur.execute('''
        CREATE TABLE data (
        busId INTEGER PRIMARY KEY,
        city TEXT,
        state TEXT,
        category TEXT,
        price TEXT,
        quarter TEXT,
        year INTEGER)
    ''')

def populate_db(cur, fileName):
    f = open(fileName, 'r')
    data = [x.rstrip() for x in f.readlines()]

    for d in data:
        row = d.split('\t')
        query = '''
            INSERT INTO data (busId, city, state, category, price, quarter, year)
            VALUES(?,?,?,?,?,?,?)
        '''
        cur.execute(query, row)

cur = db.cursor()
init_db(cur)
populate_db(cur, "../data/Data-Q2.txt")
db.commit()
cur.execute('''
    SELECT city, category, price, year, count(*)
    FROM data
    GROUP BY city, category, price, year
    ''')
result = cur.fetchall()
pprint.pprint(result)
print(len(result), "distinct cells")

db.close()

