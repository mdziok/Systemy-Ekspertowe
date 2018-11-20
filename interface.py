from pyswip import Prolog
from tkinter import *
from tkinter import ttk


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
            return
        
        self.prolog.clear()
        self.prolog.set_size(r)
        self.prolog.set_ans(ans)
        ret = self.prolog.get_ans()
        print(ret)
        if not ret:
            ret = "Nie znaleziono odpowiedniej opony dla zapytania :("
        self.result['text'] = ret
        
    def create_question(self):
        q0 = Frame(self)
        q0.pack()
        q1 = Frame(self)
        q1.pack()
        q2 = Frame(self)
        q2.pack()
        q3 = Frame(self)
        q3.pack()
        q4 = Frame(self)
        q4.pack()
        q5 = Frame(self)
        q5.pack()
        
        
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
        
        self.quit = Button(self, text="ZNAJDŹ OPONĘ DLA MNIE!",
                              command=self.send_answers)
        self.quit.pack()
        self.result = Label(self)
        self.result.pack()

    def cb(self):
        for key in self.v:
            print(key, self.v[key].get())



prolog = PrologHelper("baza.pl", "wnioskowanie.pl")
root = Tk()
app = Application(master=root, prolog=prolog)
app.mainloop()