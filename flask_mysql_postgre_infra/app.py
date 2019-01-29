from flask import Flask, render_template, request, make_response, g
import os
import random
import json
import pymysql
 


app = Flask(__name__)

#  OP -----------------------------------------
def get_mysql_test():
    config = {
        'user': 'root',
        'password': 'password',
        'host': 'db',
        'port': '3306',
        'database': 'knights'}
    connection = pymysql.connect(**config)
    cursor = connection.cursor()
    cursor.execute('SELECT * FROM favorite_colors')
    results = [{name: color} for (name, color) in cursor]
    cursor.close()
    connection.close()
    return results
#  OP -----------------------------------------



@app.route("/")
def hello():
    return 'hello-world'

@app.route("/mysql_test", methods=['POST','GET'])
def get_mysql_test():
    return json.dumps({'favorite_colors': get_mysql_test()})

@app.route("/postgre_test", methods=['POST','GET'])
def get_postgre_test():
    pass 

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000, debug=True, threaded=True)



