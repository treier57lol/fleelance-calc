# fleelance-calc
A price calculator for freelancers
import sqlite3

connection  = sqlite3.connect("Freelance alfa.db")

cursor = connection.cursor()
muutuja = input("Sisesta teenus vms: ")
fetch = cursor.execute(f"""SELECT * FROM HIND
WHERE teenused = {muutuja}""")
fetch.fetchone()
