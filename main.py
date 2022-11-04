import sqlite3

connection  = sqlite3.connect("Freelance alfa.db")

cursor = connection.cursor()
muutuja = input("Sisesta teenus vms: ")
fetch = cursor.execute(f"SELECT hind FROM teenused WHERE teenus = \"{muutuja}\"")
print(fetch.fetchone()[0])


