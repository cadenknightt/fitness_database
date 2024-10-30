#! /usr/bin/python3

from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/')
def index():
    return render_template("index.html")

@app.route('/form-get.html')
def renderFormGet():
    output = render_template('form-get.html')
    return output 

@app.route('/submitformGet.html', methods=['GET'])
def renderTableGet():
    gendername = request.args.get('gender')
    agenum = request.args.get('age')
    heightinfeet = request.args.get('feetheight')
    heightininches = request.args.get('inchesheight')
    weightnum = request.args.get('weight')
    bminum = request.args.get('bmi')
    intensity = request.args.get('intensitylevel')
    updatedat = request.args.get('updated')
    
    output = render_template('table.html', 
                             gendername=gendername, 
                             agenum=agenum, 
                             heightinfeet=heightinfeet, 
                             heightininches=heightininches, 
                             weightnum=weightnum, 
                             bminum=bminum, 
                             intensity=intensity, 
                             updatedat=updatedat)
    return output 

@app.route('/form-post.html')
def renderFormPost():
    output = render_template('form-post.html')
    return output 

@app.route('/submitformPost.html', methods=['POST'])
def renderTablePost():
    gendername = request.form.get('gender')
    agenum = request.form.get('age')
    heightinfeet = request.form.get('feetheight')
    heightininches = request.form.get('inchesheight')
    weightnum = request.form.get('weight')
    bminum = request.form.get('bmi')
    intensity = request.form.get('intensitylevel')
    updatedat = request.form.get('updated')
    
    output = render_template('table.html', 
                             gendername=gendername, 
                             agenum=agenum, 
                             heightinfeet=heightinfeet, 
                             heightininches=heightininches, 
                             weightnum=weightnum, 
                             bminum=bminum, 
                             intensity=intensity, 
                             updatedat=updatedat)
    return output 

@app.route('/table-list.html')
def renderMultiple():
    exampleCollection = [{
        'gendername': 'Male',
        'agenum': '22',
        'heightinfeet': '6',
        'heightininches': '2',
        'weightnum': '173',
        'bminum': '23.1',
        'intensity': 'Heavy',
        'updatedat': '2024-10-22 13:42:10',
    }]
    output = render_template('table-list.html', collection=exampleCollection)
    return output 

if __name__ == '__main__':
    app.run(port=8050, debug=True, host="0.0.0.0")