import sqlite3

conn = sqlite3.connect('database.db', check_same_thread=False)

def make_query(sql, parameters=None):
    if parameters:
        res = conn.execute(sql, parameters)
    else:
        res = conn.execute(sql)
    conn.commit()
    return res.fetchall()

def create_db():
    return make_query('CREATE TABLE IF NOT EXISTS flags (flag_id TEXT, password TEXT, flag TEXT)')

def put_flag(flag_id, password, flag):
    return make_query('INSERT INTO flags (flag_id, password, flag) VALUES (?, ?, ?)', (flag_id, password, flag))

def get_flag(flag_id, password):
    return make_query(f'SELECT flag FROM flags WHERE flag_id = ? AND password = "{password}"', (flag_id,))
