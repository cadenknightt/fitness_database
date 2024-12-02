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

@app.route('/showPerson', methods=['GET', 'POST'])
def showPerson():
     connection = mysql.connector.connect(**creds)
     mycursor = connection.cursor()

     FIRSTNAME = request.args.get('FirstName')
     LASTNAME = request.args.get('LastName')
     EMAIL = request.args.get('Email')
     if FIRSTNAME is not None and LASTNAME is not None and EMAIL is not None:
          mycursor.execute("INSERT INTO person (firstName, lastName, email) VALUES (%s, %s, %s)", (FIRSTNAME, LASTNAME, EMAIL))
          connection.commit()

     deletePersonID = request.args.get('deletePersonID')
     if deletePersonID is not None:
          try:
               mycursor.execute("DELETE FROM person WHERE id=%s", (deletePersonID,))
               connection.commit()
          except:
               return "Error deleting Person"
     
     mycursor.execute("SELECT * FROM person")
     allPeople = mycursor.fetchall()
     pageTitle = "Showing All People"


     mycursor.close()
     connection.close()   
     return render_template('personTable.html', navbar=navbar_html, pageTitle=pageTitle, personTable=allPeople)

@app.route('/showPersonInfo', methods=['GET', 'POST'])
def showPersonInfo():
     connection = mysql.connector.connect(**creds)
     mycursor = connection.cursor()

     personID = request.args.get('personID')
     if personID is None:
          return redirect(url_for("showPerson"))
     
     NEWFIRST = request.args.get('FirstName')
     NEWLAST = request.args.get('LastName')
     NEWEMAIL = request.args.get('Email')
     if NEWFIRST is not None and NEWLAST is not None and NEWEMAIL is not None:
          mycursor.execute("UPDATE person SET firstName=%s, lastName=%s, email=%s WHERE id=%s", (NEWFIRST, NEWLAST, NEWEMAIL, personID))
          connection.commit()

     addEquipmentID = request.args.get('addEquipmentID')
     if addEquipmentID is not None and personID is not None:
          mycursor.execute("INSERT INTO personEquipment (personID, equipmentID) VALUES (%s, %s)", (personID, addEquipmentID))
          connection.commit()
     
     deleteEquipmentID = request.args.get('deleteEquipmentID')
     if deleteEquipmentID is not None:
          mycursor.execute("DELETE FROM personEquipment WHERE personID=%s AND equipmentID=%s", (personID, deleteEquipmentID))
          connection.commit()
     
     mycursor.execute("SELECT firstName, lastName, email FROM person WHERE id=%s", (personID,))
     personFirst, personLast, personEmail = mycursor.fetchone()
     if personFirst is None and personLast is None and personEmail is None:
          return """Error: Person not found. <a href="/showPerson">Return to Person</a>"""
     
     mycursor.execute("""SELECT e.id, e.item, e.purpose
                           FROM equipment e
                           JOIN personEquipment pe ON e.id=pe.equipmentID
                           JOIN person p ON p.id=pe.personID
                           WHERE p.id=%s""", (personID,))
     persons_equipment = mycursor.fetchall()

     mycursor.execute("""SELECT DISTINCT e.id, e.item, e.purpose
                                FROM equipment e
                                WHERE id NOT IN (
                                   SELECT equipmentID
                                   FROM personEquipment pe
                                   WHERE pe.personID=%s)""", (personID,))
     otherEquipmentTypes = mycursor.fetchall()
     
     mycursor.close()
     connection.close()

     return render_template('personInfoTable.html', navbar=navbar_html, personID=personID, existingFirst=personFirst, existingLast=personLast, existingEmail=personEmail, persons_equipment=persons_equipment, otherEquipmentTypes=otherEquipmentTypes)
          
@app.route('/showEquipmentInfo', methods=['GET', 'POST'])
def showEquipmentInfo():
     connection = mysql.connector.connect(**creds)
     mycursor = connection.cursor()

     equipmentID = request.args.get('equipmentID')
     if equipmentID is None:
          return redirect(url_for("showEquipment"))
     
     NEWEQUIPMENT = request.args.get('Equipment')
     NEWPURPOSE = request.args.get('Purpose')
     if NEWEQUIPMENT is not None and NEWPURPOSE is not None:
          mycursor.execute("UPDATE equipment SET item=%s, purpose=%s WHERE id=%s", (NEWEQUIPMENT, NEWPURPOSE, equipmentID))
          connection.commit()

     addPersonID = request.args.get('addPersonID')
     if addPersonID is not None and equipmentID is not None:
          mycursor.execute("INSERT INTO personEquipment (personID, equipmentID) VALUES (%s, %s)", (addPersonID, equipmentID))
          connection.commit()
     
     deletePersonID = request.args.get('deletePersonID')
     if deletePersonID is not None:
          mycursor.execute("DELETE FROM personEquipment WHERE personID=%s AND equipmentID=%s", (deletePersonID, equipmentID))
          connection.commit()
     
     mycursor.execute("SELECT item, purpose FROM equipment WHERE id=%s", (equipmentID,))
     equipmentItem, equipmentPurpose = mycursor.fetchone()
     if equipmentItem is None and equipmentPurpose is None:
          return """Error: Equipment not found. <a href="/showEquipment">Return to Equipment</a>"""
     
     mycursor.execute("""SELECT p.id, p.firstName, p.lastName, p.email, p.created
                           FROM person p
                           JOIN personEquipment pe ON p.id=pe.personID
                           JOIN equipment e ON e.id=pe.equipmentID
                           WHERE e.id=%s""", (equipmentID,))
     equipment_person = mycursor.fetchall()

     mycursor.execute("""SELECT DISTINCT p.id, p.firstName, p.lastName, p.email, p.created
                                FROM person p
                                WHERE p.id NOT IN (
                                   SELECT personID
                                   FROM personEquipment pe
                                   WHERE pe.equipmentID=%s)""", (equipmentID,))
     otherPeople = mycursor.fetchall()
     
     mycursor.close()
     connection.close()

     return render_template('equipmentInfoTable.html', navbar=navbar_html, equipmentID=equipmentID, existingEquipment=equipmentItem, existingPurpose=equipmentPurpose, equipment_person=equipment_person, otherPeople=otherPeople)

@app.route('/showEquipment', methods=['GET'])
def showEquipment():
     connection = mysql.connector.connect(**creds)
     mycursor = connection.cursor()

     connection = mysql.connector.connect(**creds)
     mycursor = connection.cursor()

     EQUIPMENT = request.args.get('Equipment')
     PURPOSE = request.args.get('Purpose')
     if EQUIPMENT is not None and PURPOSE is not None:
          mycursor.execute("INSERT INTO equipment (item, purpose) VALUES (%s, %s)", (EQUIPMENT, PURPOSE))
          connection.commit()

     deletePersonID = request.args.get('deleteEquipmentID')
     if deletePersonID is not None:
          try:
               mycursor.execute("DELETE FROM equipment WHERE id=%s", (deletePersonID,))
               connection.commit()
          except:
               return "Error deleting Equipment"
     
     mycursor.execute("SELECT * FROM equipment")
     allEquipment = mycursor.fetchall()
     pageTitle = "Showing All Equipment"

     mycursor.close()
     connection.close()   
     return render_template('equipmentTable.html', navbar=navbar_html, pageTitle=pageTitle, equipmentTable=allEquipment)

if __name__ == '__main__':
    app.run(port=8005, debug=True, host="0.0.0.0")