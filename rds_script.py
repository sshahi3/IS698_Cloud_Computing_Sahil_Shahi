import mysql.connector
# Connect to RDS
conn = mysql.connector.connect(
    host="studentdb.c2leouoio2k8.us-east-1.rds.amazonaws.com",
    user="admin",
    password="Shahirox1509",
    database="University"
)
cursor = conn.cursor()
# Insert Data
cursor.execute("INSERT INTO Students VALUES (2, 'Jane Smith', 22, 'Mathematics')")
conn.commit()
# Fetch Data
cursor.execute("SELECT * FROM Students")
for row in cursor.fetchall():
    print(row)
# Close connection
cursor.close()
conn.close()
