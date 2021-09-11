from flask import Flask, request
from flask_mysqldb import MySQL
import yaml
app = Flask(__name__)

#importing db.yaml
db = yaml.load(open('database.yaml'))
# used separate config file to hide sensitive information
app.config['MYSQL_HOST'] = db['mysql_host']
app.config['MYSQL_USER'] = db['mysql_user']
app.config['MYSQL_PASSWORD'] = db['mysql_password']
app.config['MYSQL_DB'] = db['mysql_db']

mysql = MySQL(app)





#for loginpage
@app.route("/" ,methods=['GET', 'POST'])
def login():
    name = "to be name"
    email = "to be email"
    if request.method == "GET":
        cur = mysql.connection.cursor()
        cur.execute(f'INSERT INTO users(name, email) VALUES("{name}","{email}")')
        mysql.connection.commit()
        cur.close()
        return "yay"
    else:
        username = ""
        password = ""

        loginDict = {}
        login[username] = password

if __name__ == "__main__":
    app.run()


'''

result = cur.execute("select* from users)
//to fetch this we use
if result > 0:
    detailResult = cur.fetchall()

'''