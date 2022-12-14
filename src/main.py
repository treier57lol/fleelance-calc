import os
from pathlib import Path
import sys
import sqlite3
import locale

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtCore import QObject, Slot, Signal

class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)
        locale.setlocale(locale.LC_MONETARY, '') # sätib programmi rahaühikud arvuti regiooniliste sätete järgi
        self.selected_task = ()
        self.duration = 0
    
    calcPrice = Signal(str)
    calcDuration = Signal(str)
    searchResult = Signal(list)
    clearSearch = Signal()

    @Slot(float)
    def format_currency(self, number): # vormista hind kuvamiseks
        try:
            return locale.currency(number, grouping=True)
        except:
            return "Formating error"

    @Slot(float)
    def set_calc_value(self, number): # näita hinda kalkulaatori ekraanil
        try:
            self.calcPrice.emit(self.format_currency(number))
        except:
            self.calcPrice.emit("Error NaNa")
    
    @Slot(int)
    def set_duration_value(self, days): # näita ajakulu kalkulaatori ekraanil
        try:
            self.duration = days
            self.calcDuration.emit(f"Duration: {self.duration} days")
        except:
            self.calcDuration.emit("Error NaN")
    
    @Slot()
    def calc_total(self): # arvuta kogu töö tasu
        try:
            self.set_calc_value(self.selected_task[1]*self.duration)
        except:
            print("Valimata töö")

    @Slot(str)
    def task_select(self, query): # jooksutatakse töö peale vajutamisel
        self.selected_task = cursor.execute(f"SELECT * FROM teenused WHERE teenus = \"{query}\"").fetchone()
        self.set_calc_value(float(self.selected_task[1]))
    
    @Slot(str)
    def search(self, query): # otsinguriba
        try:
            results = self.sql_fetch_all(f"SELECT * FROM teenused WHERE teenus LIKE \"%{query}%\"")
            self.populate_tasks(results)
        except:
            print("Error")

    def populate_tasks(self, tasks): # täidab tööde nimekirja
        self.clearSearch.emit()
        for task in tasks:
            task = [x for x in task]
            try:
                task[1] = self.format_currency(float(task[1]))
            except:
                self.searchResult.emit([task[0],"NaN"])
                continue
            self.searchResult.emit(task)
    
    def sql_fetch_all(self, command):
        return cursor.execute(command).fetchall()
        

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    main = MainWindow()
    engine.rootContext().setContextProperty("backend", main)

    # SQLite ühendus
    connection = sqlite3.connect("Freelance alfa.db")

    # Lae QML
    engine.load(os.fspath(Path(__file__).resolve().parent / "main.qml"))
    cursor = connection.cursor()
    
    main.set_calc_value(0.00) # nullib maksumuse
    main.set_duration_value(0) # nullib pikkuse
    main.populate_tasks(cursor.execute(f"SELECT * FROM teenused").fetchall()) # täidab nimekirja kõikide töödega

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())