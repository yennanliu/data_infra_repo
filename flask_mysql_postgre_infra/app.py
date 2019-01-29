from flask import Flask, render_template, request, make_response, g
import os
import random
import json
import pymysql
import pymysql.cursors

app = Flask(__name__)

#  OP -----------------------------------------
def get_mysql_data():
    connection = pymysql.connect(host='mysql',
                             user='root',
                             password='password',
                             db='knights',
                             cursorclass=pymysql.cursors.DictCursor)
    with connection.cursor() as cursor:
        sql = """SELECT * FROM favorite_colors"""
        cursor.execute(sql)
        result = cursor.fetchall()
        print (result)
    cursor.close()
    connection.close()
    return result[0]
#  OP -----------------------------------------


@app.route("/")
def hello():
    return 'hello-world'

@app.route("/mysql_test")
def get_mysql_test():
    return json.dumps({'favorite_colors': get_mysql_data()})

@app.route("/postgre_test", methods=['POST','GET'])
def get_postgre_test():
    pass 

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000, debug=True, threaded=True)
