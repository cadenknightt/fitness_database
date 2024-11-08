#! /usr/bin/python3

from flask import Flask, render_template, request, redirect, url_for
import mysql.connector, os, json

app = Flask(__name__)

navbar_html = """
<nav>
     <ul>
          <a href="/">Home</a>
          <a href="/input.html">Form</a>   
          <a href="/personTable.html">Person Table</a>
     </ul>
</nav>
"""

with open('/home/cadenknightt/fitness_database/Project/secret.json', 'r') as secretFile:
          creds = json.load(secretFile)['mysqlCredentials']

connection = mysql.connector.connect(**creds)

@app.route('/')
def indexPage():
     output = render_template('index.html', navbar=navbar_html)
     return output

@app.route('/input.html')
def inputPage():
     output = render_template('input.html', navbar=navbar_html)
     return output

@app.route('/personTable.html')
def showUsersPage():

     mycursor = connection.cursor()

     personFirst = request.args.get('firstName')
     personLast = request.args.get('lastName')
     username = request.args.get('Username')
     password = request.args.get('Password')
     email = request.args.get('Email')
     if personFirst is not None and personLast is not None and username is not None and password is not None and email is not None:
          mycursor.execute("INSERT into person (firstName, lastName, Username, Password, Email) values (%s, %s, %s, %s, %s)", (personFirst, personLast, username, password, email))
          connection.commit()
     elif request.args.get('delete') == 'true':
          deleteID = request.args.get('person_id')
          try:
               deleteID = int(deleteID)
               mycursor.execute("DELETE from person where id=%s", (deleteID,))
               connection.commit()
          except:
               print('Error occured with ID')

     
     mycursor.execute("SELECT * FROM person")
     myresult = mycursor.fetchall()
     mycursor.close()
     return render_template('personTable.html', collection=myresult, navbar=navbar_html)

@app.route('/updatePerson')
def updatePerson():
     id = request.args.get('id')
     FirstName= request.args.get('firstName')
     LastName = request.args.get('lastName')
     UserName = request.args.get('Username')
     PassWord = request.args.get('Password')
     EMAIL = request.args.get('Email')
     if id is None:
          return "Error, id not specified"
     elif FirstName is not None and LastName is not None and UserName is not None and PassWord is not None and EMAIL is not None:
          mycursor = connection.cursor()
          mycursor.execute("UPDATE person SET firstName=%s, lastName=%s, Username=%s, Password=%s, Email=%s WHERE id=%s", (FirstName, LastName, UserName, PassWord, EMAIL, id))
          mycursor.close()
          connection.commit()
          return redirect(url_for('showUsersPage'))
     
     mycursor = connection.cursor()
     mycursor.execute("SELECT firstName, lastName, Username, Password, Email FROM person WHERE id=%s;", (id,))
     existingFirst, existingLast, existingUsername, existingPassword, existingEmail = mycursor.fetchone()
     mycursor.close()
     return render_template('person-update.html', id=id, existingFirst=existingFirst, existingLast=existingLast, existingUsername=existingUsername, existingPassword=existingPassword, existingEmail=existingEmail,
                           navbar=navbar_html)

if __name__ == '__main__':
    app.run(port=8000, debug=True, host="0.0.0.0")