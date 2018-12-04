from pyswip import Prolog
from tkinter import *
from tkinter import ttk
import webbrowser
import csv
import functools


class PrologHelper():
    def __init__(self, filename1, filename2):
        self.prolog = Prolog()
        self.prolog.consult(filename1)
        self.prolog.consult(filename2)
        
    def clear(self):
        print("clear", list(self.prolog.query("wyczysc")))
        
    def set_size(self, size):
        print(list(self.prolog.query("kolo({})".format(size))))
    
    def set_ans(self, ans):
        for a in ans:
            print(list(self.prolog.query(a)))
    
    def get_ans(self):
        ret = []
        for result in self.prolog.query("opona(X)"):
            ret.append(result['X'])
        return set(ret)
    

class Application(Frame):
    def __init__(self, master=None, prolog=None):
        super().__init__(master)
        self.master = master
        self.pack()
        self.create_question()
        self.prolog = prolog
        
    def send_answers(self):
        
        r = self.rozmiar.get() 
        ans = [self.pogoda.get(), self.poziom.get(), self.miasto.get(), self.wygoda.get()]

        if not r:
            self.result['text'] = "Musisz wybrać odpowiedzi na wszystkie pytania!"
            return
        for a in ans:
            if not a:
                self.result['text'] = "Musisz wybrać odpowiedzi na wszystkie pytania!"
                return
        count = 0
        for key in self.v:
            if self.v[key].get():
                count += 1
                ans.append(key)
        if count == 0:
            self.result['text'] = "Musisz wybrać odpowiedzi na wszystkie pytania!"
            return
        
        self.prolog.clear()
        self.prolog.set_size(r)
        self.prolog.set_ans(ans)
        ret = self.prolog.get_ans()
        self.display_answers(ret)
        
    def display_answers(self, ans):
        for widget in self.an.winfo_children():
            widget.destroy()
        if not ans:
            self.result['text'] = "Nie znaleziono odpowiedniej opony dla zapytania :("
            return
        self.result['text'] = "Oto proponowane dla Ciebie opony :)"
        for a in ans:       
            text = self.dane[a][1]
            l = Label(self.an, text=text, fg='blue', cursor="hand2")
            arg = self.dane[a][0]
            l.pack()
            l.bind("<Button-1>", functools.partial(self.callback, arg))
            
    def callback(self, arg, event):
        webbrowser.open_new(arg)
        
    def create_question(self):
        q = Frame(self)
        q.pack()
        q0 = Frame(q)
        q0.pack()
        q1 = Frame(q)
        q1.pack()
        q2 = Frame(q)
        q2.pack()
        q3 = Frame(q)
        q3.pack()
        q4 = Frame(q)
        q4.pack()
        q5 = Frame(q)
        q5.pack()
        self.an = Frame(self)
        self.an.pack()
        
        Label(q0, text="Wybierz rozmiar koła w calach:").pack()
        self.rozmiar = StringVar()
        modes = [('26', '26'), ('28','28')]
        for t, m in modes:
            Radiobutton(q0, text=t, variable=self.rozmiar, value=m).pack(side='left')
        
        
        Label(q1, text="Wybierz teren, po którym jeździsz:").pack()
        self.teren = StringVar()
        modes = [('Asfalt', 'asfalt'), ('Szuter','szuter'), ('Teren','teren'), ('Bezdroża', 'bezdroza')]
        self.v = {}
        for t, m in modes:
            self.v[m] = IntVar()
            Checkbutton(q1, text=t, variable=self.v[m]).pack(side='left')
#             Radiobutton(q1, text=t, variable=self.teren, value=m).pack(side='left')
        
        Label(q2, text="Wybierz warunki, w jakich się poruszasz:").pack()
        self.pogoda = StringVar()
        modes = [('Tylko sucho', 'tylko_sucho'), ('Głównie sucho', 'glownie_sucho'), ('Czasem mokro', 'czasem_mokro'), ('Każda pogoda', 'kazda_pogoda')]
        for t, m in modes:
            Radiobutton(q2, text=t, variable=self.pogoda, value=m).pack(side='left')
    
        Label(q3, text="Wybierz na jakim poziomie jeździsz:").pack()
        self.poziom = StringVar()
        modes = [('Sportowy', 'sportowo'), ('Amatorski','amatorsko')]
        for t, m in modes:
            Radiobutton(q3, text=t, variable=self.poziom, value=m).pack(side='left')
        
        Label(q4, text="Jak często poruszasz się po mieście:").pack()
        self.miasto = StringVar()
        modes = [('Zawsze', 'tylko_miasto'), ('Czasem','czasem_miasto'), ('Nigdy','nigdy_miasto')]
        for t, m in modes:
            Radiobutton(q4, text=t, variable=self.miasto, value=m).pack(side='left')
        
        Label(q5, text="Jaki styl jazdy preferujesz:").pack()
        self.wygoda = StringVar()
        modes = [('Wygodny', 'wygodnie'), ('Szybki','szybko')]
        for t, m in modes:
            Radiobutton(q5, text=t, variable=self.wygoda, value=m).pack(side='left')
        
        self.quit = Button(q, text="ZNAJDŹ OPONĘ DLA MNIE!",
                              command=self.send_answers)
        self.quit.pack()
        self.result = Label(q)
        self.result.pack()

# parsowanie pliku i komentarzy - zamienić na czytanie właściwości z pliku         
with open("baza.pl") as file:
    baza = file.readlines()
links = []
names = []
for line in baza:
    if line.startswith('/* https'):
        links.append(line.split(' ')[1])
    if line.startswith('opona'):
        names.append(line.replace(')', '(').split('(')[1])
link_dict = {}
for key, value in zip(names, links):
    link_dict[key] = value
# koniec parsowania
    
prolog = PrologHelper("baza.pl", "wnioskowanie.pl")
reader = csv.reader(open('baza.csv', newline=''))
dane = {}
for row in reader:
    dane[row[0]] = [row[1], row[2]]
root = Tk()
app = Application(master=root, prolog=prolog, dane=dane)
app.mainloop()