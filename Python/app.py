from flask import Flask, render_template
import mysql.connector

app = Flask(__name__)

@app.route('/')
def index():
    try:
        # Replace these with your MySQL database credentials
        db_connection = mysql.connector.connect(
            host='mysql',
            user='root',
            password='jugnu670',
            database='jugnu'
        )

        if db_connection.is_connected():
            message = "MySQL connection successful!"
        else:
            message = "MySQL connection failed!"
        
        db_connection.close()

    except mysql.connector.Error as err:
        message = f"MySQL connection error: {err}"

    return render_template('index.html', message=message)

if __name__ == '__main__':
    app.run(debug=True)
