import os
from pathlib import Path
import sys
import sqlite3

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    engine.load(os.fspath(Path(__file__).resolve().parent / "main.qml"))
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())

connection = sqlite3.connect("Freelance alfa.db")
rahulolu = False

def valik():
    teenus1 = input("Millist teenust soovid müüa? (väljumiseks kirjuta 'välju') ")
    if teenus1 == "välju":
        return True
    cursor = connection.cursor()
    fetch = cursor.execute(f"SELECT hind FROM teenused WHERE teenus = \"{teenus1}\"")
    try:
        raha = fetch.fetchone()[0]
    except:
        print("Sellist teenust ei leitud!")
        return False
    print(f"Antud teenuse eest oleks optimaalne küsida {raha} eurot")
    jätka = input("Kas soovid veel valida? (jah/ei) ")
    if jätka == "jah":
        return False
    elif jätka == "ei":
        return True

while not rahulolu:
    rahulolu = valik()
