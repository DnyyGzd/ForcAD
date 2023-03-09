#!/usr/bin/python3

from flask import Flask

import app_db

app = Flask(__name__)

@app.route('/')
def index():
    page = '''Welcome to the first UniPa Challenge.<br/>
    Do you want flags? Look for them.'''
    return page

@app.route('/put_flag/<flag_id>/<password>/<flag>')
def put_flag(flag_id, password, flag):
    app_db.put_flag(flag_id, password, flag)
    page = "Flag put."
    return page

@app.route('/get_flag/<flag_id>/<password>')
def get_flag(flag_id, password):
    flag = app_db.get_flag(flag_id, password)
    if flag:
        page = f"Flag: {flag[0][0]}"
    else:
        page = "I am watching you."
    return page

def main():
    app_db.create_db()
    app.run(debug=True, host='0.0.0.0', port=9876)

if __name__ == '__main__':
    main()
