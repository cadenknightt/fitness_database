#! /usr/bin/python3

from flask import Flask, render_template, request, redirect, url_for
import mysql.connector, os, json

app = Flask(__name__)

navbar_html = """
<nav>
     <ul>
          <a href="/">Home</a>
          <a href="/personStatisticsTable.html">Person Statistics</a>
          <a href="/PersonAndEquipment.html">Person & Equipment</a>  
     </ul>
</nav>
"""

with open('/home/cadenknightt/fitness_database/Project/secret.json', 'r') as secretFile:
          creds = json.load(secretFile)['mysqlCredentials']

connection = mysql.connector.connect(**creds)

@app.route('/')
def indexPage():
     return render_template('index.html', navbar=navbar_html)

@app.route('/personStatisticsForm.html')
def inputPage():
     mycursor = connection.cursor()

     mycursor.execute("""SELECT id, firstName, lastName
                    FROM person
                    WHERE id NOT IN ( 
                         SELECT personID
                         FROM personStatistics
                         )
                    """)
     people = mycursor.fetchall()
     print(people)
    
     mycursor.execute("SELECT personID FROM personStatistics")
     personID_Stat = [row[0] for row in mycursor.fetchall()]

     mycursor.close()
     return render_template('personStatisticsForm.html', navbar=navbar_html, people=people, personID_Stat=personID_Stat)

@app.route('/personStatisticsTable.html')
def showPersonStatisticsPage():

     mycursor = connection.cursor()

     person = request.args.get('id')
     gender = request.args.get('Gender')
     age = request.args.get('Age')
     heightinches = request.args.get('HeightInches')
     weight = request.args.get('Weight')
     bmi = request.args.get('BMI')
     intensitylevel = request.args.get('IntensityLevel')
     if person is not None and gender is not None and age is not None and heightinches is not None and weight is not None and bmi is not None and intensitylevel is not None:
          mycursor.execute("INSERT INTO personStatistics (personID, gender, age, heightInches, weight, BMI, intensityLevel) VALUES (%s, %s, %s, %s, %s, %s, %s)", (person, gender, age, heightinches, weight, bmi, intensitylevel))
          connection.commit()
     elif request.args.get('delete') == 'true':
          deleteID = request.args.get('personStatistics_id')
          try:
               deleteID = int(deleteID)
               mycursor.execute("DELETE FROM personStatistics where personID=%s", (deleteID,))
               connection.commit()
          except:
               print('Error occured with ID')

     mycursor.execute("SELECT * FROM personStatistics")
     myresult = mycursor.fetchall()
     mycursor.close()
     return render_template('personStatisticsTable.html', personStatistics=myresult, navbar=navbar_html)

@app.route('/updatePersonStatistics')
def updatePersonStatistics():
     PERSONID = request.args.get('id')
     print(f"Retreived: {PERSONID}")
     try:
          PERSONID = int(PERSONID)
     except:
          return "Error: Invalid ID"

     GENDER = request.args.get('Gender')
     AGE = request.args.get('Age')
     HEIGHTINCHES = request.args.get('HeightInches')
     WEIGHT = request.args.get('Weight')
     BMI = request.args.get('BMI')
     INTENSITYLEVEL = request.args.get('IntensityLevel')

     if PERSONID is None:
          return "Error: id not specified."
     elif GENDER is not None and AGE is not None and HEIGHTINCHES is not None and WEIGHT is not None and BMI is not None and INTENSITYLEVEL is not None:
          mycursor = connection.cursor()
          mycursor.execute("UPDATE personStatistics SET gender=%s, age=%s, heightinches=%s, weight=%s, BMI=%s, intensityLevel=%s WHERE personID=%s", 
          (GENDER, AGE, HEIGHTINCHES, WEIGHT, BMI, INTENSITYLEVEL, PERSONID))
          mycursor.close()
          connection.commit()
          return redirect(url_for('showPersonStatisticsPage'))
     
     mycursor = connection.cursor()
     mycursor.execute("SELECT gender, age, heightInches, weight, BMI, intensityLevel FROM personStatistics WHERE personID=%s;", (PERSONID,))
     existingGender, existingAge, existingHeight, existingWeight, existingBMI, existingIntensity = mycursor.fetchone()

     mycursor.execute("SELECT firstName, lastName FROM person WHERE id=%s;", (PERSONID,))
     personResult = mycursor.fetchone()
     personNameTitle = f"{personResult[0]} {personResult[1]}"
     mycursor.close()

     return render_template('personStatisticsUpdate.html', existingID=PERSONID, existingGender=existingGender, existingAge=existingAge, existingHeight=existingHeight, existingWeight=existingWeight, existingBMI=existingBMI, existingIntensity=existingIntensity, navbar=navbar_html, personNameTitle=personNameTitle)

@app.route('/PersonAndEquipment.html')
def defaultPersonEquipmentPage():
     return render_template('PersonAndEquipment.html', navbar=navbar_html)

@app.route('/showPerson', methods=['GET'])
def showPerson():
     connection = mysql.connector.connect(**creds)
     mycursor = connection.cursor()
     equipmentID = request.args.get('equipmentID')

     if equipmentID is not None:
          mycursor.execute("""SELECT person.id, firstName, lastName, email, created, item 
                           FROM person
                           JOIN personEquipment ON person.id=personEquipment.personID
                           JOIN equipment ON equipment.id=personEquipment.equipmentID
                           WHERE equipmentID=%s""", (equipmentID,))
          personresult = mycursor.fetchall()
          if len(personresult) >= 1:
               equipmentName = personresult[0][5]
          else:
               equipmentName = "Unknown"
          personPageTitle = f"Showing All People Using {equipmentName}" 
     else:
          mycursor.execute("SELECT * FROM person")
          personPageTitle = "Showing All People" 
          personresult = mycursor.fetchall()

     mycursor.close()
     connection.close()   
     return render_template('personTable.html', navbar=navbar_html, personPageTitle=personPageTitle, personTable=personresult)

@app.route('/showEquipment', methods=['GET'])
def showEquipment():
     connection = mysql.connector.connect(**creds)
     mycursor = connection.cursor()
     personID = request.args.get('personID')

     if personID is not None:
          addEquipmentID = request.args.get('addEquipmentID')
          if addEquipmentID is not None:
               mycursor.execute("INSERT INTO personEquipment (personID, equipmentID) VALUES (%s, %s)", (personID, addEquipmentID))
               connection.commit()
          
          mycursor.execute("""SELECT equipmentID, item, purpose, firstName, lastName 
                           FROM equipment
                           JOIN personEquipment ON equipment.id=personEquipment.equipmentID
                           JOIN person ON person.id=personEquipment.personID
                           WHERE person.id=%s""", (personID,))
          equipmentresult = mycursor.fetchall()
          print(equipmentresult)
          if len(equipmentresult) >= 1:
               personName = equipmentresult[0][3] + " " + equipmentresult[0][4]
               mycursor.execute("""SELECT DISTINCT equipmentID, item, purpose
                                FROM equipment
                                JOIN personEquipment ON equipment.id=personEquipment.equipmentID
                                WHERE id NOT IN (
                                   SELECT equipmentID
                                   FROM personEquipment
                                   WHERE personEquipment.personID=%s)""", (personID,))
               otherEquipmentTypes = mycursor.fetchall()
               print(otherEquipmentTypes)
          else:
               personName = "Unknown"
               otherEquipmentTypes = None
          equipmentPageTitle = f"Showing Equipment Used By {personName}"
     else:
          mycursor.execute("SELECT * FROM equipment")
          equipmentPageTitle = "Showing All Equipment"
          equipmentresult = mycursor.fetchall()
          otherEquipmentTypes = None

     mycursor.close()
     connection.close()   
     return render_template('equipmentTable.html', navbar=navbar_html, equipmentPageTitle=equipmentPageTitle, equipmentTable=equipmentresult, otherEquipmentTypes=otherEquipmentTypes, personID=personID)

if __name__ == '__main__':
    app.run(port=8002, debug=True, host="0.0.0.0")