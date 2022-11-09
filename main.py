import sqlite3
connection  = sqlite3.connect("Freelance alfa.db")
def valik(muutuja):
    rahulolu = ""
    while rahulolu != -1:
        cursor = connection.cursor()
        fetch = cursor.execute(f"SELECT hind FROM teenused WHERE teenus = \"{muutuja}\"")
        raha = fetch.fetchone()[0]
        print("Antud teenuse eest oleks optimaalne küsida", raha, "eurot")
        rahulolu = input("Kas soovid veel valida? (jah/ei) ")
        if rahulolu == "jah":
            muutuja = input("Sisesta siis teenus vms: ")
        elif rahulolu == "ei":
            break
        else:
            rahulolu = -1
teenus1 = input("Millist teenust soovid müüa? ")
esialgne = str(teenus1)
valik(esialgne)
