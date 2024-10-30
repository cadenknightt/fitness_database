#! /usr/bin/python3

from flask import Flask, render_template, request
import mysql.connector, os
import json

app = Flask(__name__)

navbar_html = """
<nav>
     <ul>
          <a href="/">Home</a>
          <a href="/input.html">Form</a>   
          <a href="/userTable.html">Person Table</a>
     </ul>
</nav>
"""

@app.route('/')
def indexPage():
     output = render_template('index.html', navbar=navbar_html)
     return output

@app.route('/input.html')
def inputPage():
     output = render_template('input.html', navbar=navbar_html)
     return output

@app.route('/userTable.html')
def showUsersPage():
     with open('/home/cadenknightt/fitness_database/Project - HTML From a Database Table/secret.json', 'r') as secretFile:
          creds = json.load(secretFile)['mysqlCredentials']

     connection = mysql.connector.connect(**creds)

     mycursor = connection.cursor()

     personFirst = request.args.get('firstName')
     personLast = request.args.get('lastName')
     username = request.args.get('Username')
     password = request.args.get('Password')
     email = request.args.get('Email')
     if personFirst is not None and personLast is not None and username is not None and password is not None and email is not None:
          mycursor.execute("INSERT into person (firstName, lastName, Username, Password, Email) values (%s, %s, %s, %s, %s)", (personFirst, personLast, username, password, email))
          connection.commit()
     
     mycursor.execute("SELECT firstName, lastName, username, password, email, created FROM person")
     myresult = mycursor.fetchall()
     mycursor.close()
     connection.close()
     return render_template('userTable.html', collection=myresult, navbar=navbar_html)

if __name__ == '__main__':
    app.run(port=8000, debug=True, host="0.0.0.0")