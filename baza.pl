:- dynamic
         rozmiar/1.
         jezdzi/1.

/* https://www.continental-tires.com/bicycle/tires/race-tires/gatorskin */
opona(c_gatorskin) :- rozmiar(28),
	szerokosc(28, szosowa),
    psi(95, 120, szosowa),
    waga(310, szosowa),
    bieznik(delikatny),
    antyprzebicie(tak),
    typ(szosowa).

/* https://www.continental-tires.com/bicycle/tires/race-tires/ultra-sport2 */
opona(c_ultra_sport) :- rozmiar(28),
	szerokosc(25, szosowa),
    psi(95, 120, szosowa),
    waga(340, szosowa),
    bieznik(gladki),
    antyprzebicie(nie),
    typ(szosowa).

/* https://www.continental-tires.com/bicycle/tires/race-tires/grand-prix-4-season */
opona(c_grand_prix) :- rozmiar(28),
    szerokosc(25, szosowa),
    psi(95, 120, szosowa),
    waga(225, szosowa),
    bieznik(delikatny),
    antyprzebicie(tak),
    typ(szosowa).

/* https://www.continental-tires.com/bicycle/tires/city-trekking-tires/contact */
opona(c_contact) :- rozmiar(28),
    szerokosc(37, trekkingowa),
    psi(56, 85, trekkingowa),
    waga(620, trekkingowa),
    bieznik(delikatny),
    antyprzebicie(tak),
    typ(trekkingowa).

/* https://www.continental-tires.com/bicycle/tires/city-trekking-tires/ride-tour */
opona(c_ride) :- rozmiar(28),
    szerokosc(42, trekkingowa),
    psi(50, 62, trekkingowa),
    waga(720, trekkingowa),
    bieznik(wyrazny),
    antyprzebicie(tak),
    typ(trekkingowa).

/* kat. 1 : NAWIERZCHNIA */
/* typo potrzebnej opony */
typ(szosowy) :- jezdzi(asfalt).
typ(trekkingowa) :- jezdzi(asfalt).
typ(trekkingowa) :- jezdzi(szuter).
typ(gorska) :- jezdzi(szuter).
typ(gorska) :- jezdzi(teren).
typ(gorska) :- jezdzi(bezdroza).


/* kat.2 : WARUNKI */
/* jakiego bieznika potrzebujemy  - w odniesieniu do pogody */
bieznik(gladki) :- jezdzi(tylko_sucho).
bieznik(gladki) :- jezdzi(glownie_sucho).

bieznik(delikatny) :- jezdzi(tylko_sucho).
bieznik(delikatny) :- jezdzi(glownie_sucho).
bieznik(delikatny) :- jezdzi(czasem_mokro).

bieznik(wyrazny) :- jezdzi(tylko_sucho).
bieznik(wyrazny) :- jezdzi(glownie_sucho).
bieznik(wyrazny) :- jezdzi(czasem_mokro).
bieznik(wyrazny) :- jezdzi(kazda_pogoda).


/* kat.3 : POZIOM */
/* wnioskujemy, czy podana waga opony jest w porządku */
wymaga(lekki) :- jezdzi(sportowo).
wymaga(dowolny_ciezar) :- jezdzi(amatorsko).

waga(X, trekkingowa) :- X < 800, wymaga(lekki).
waga(X, szosowa) :- X < 300, wymaga(lekki).

waga(_, _) :- wymaga(dowolny_ciezar).

/* wnioskujemy, czy podane psi jest w porzadku */
psi(X, Y, _) :- X > 0, Y > 0, jezdzi(amatorsko).
psi(X, Y, _) :- X > 0, Y > 0, jezdzi(sportowo).


/* kat.4 : CZY MIASTO */
/* czy potrzebujemy antyprzebicia */
antyprzebicie(nie) :- jezdzi(nigdy_miasto).
antyprzebicie(tak) :- jezdzi(miasto).
antyprzebicie(tak) :- jezdzi(tylko_miasto).


/* kat.5 : WYGODA */
/* wnioskujemy, czy podana szerokosc opony jest w porządku */
/* dopracowac wartosci */
wymaga(szeroki) :- jezdzi(wygodnie).
wymaga(cienki) :- jezdzi(szybko).
szerokosc(X, trekkingowa) :- X < 40, wymaga(cienki).
szerokosc(X, trekkingowa) :- X > 40, wymaga(szeroki).
szerokosc(X, szosowa) :- X < 26, wymaga(cienki).
szerokosc(X, szosowa) :- X > 26, wymaga(szeroki).


/* Przykladowe pytania:
- po jakim terenie sie poruszasz przede wszystkim? asfalt - szuter - teren - bezdroza
- w jakich warunkach jezdzisz? tylko suche, glownie suche, czasem mokro, niezaleznie
- czy jezdzisz sportowo? tak - nie
- czy lubisz wygodna jazde ? tak - nie
- czy jezdzisz po miescie? tak - czasem - nie
- co preferujesz? spokojne przemieszczanie sie - jazda na czas
*/


/* dane, jakie otrzymamy od uzytkownika */
kolo(X) :- assertz(rozmiar(X)).

/* kat. 1 : NAWIERZCHNIA */
asfalt :- assertz(jezdzi(asfalt)).
szuter :- assertz(jezdzi(szuter)).
teren :- assertz(jezdzi(teren)).
bezdroza :- assertz(jezdzi(bezdroza)).

/* kat.2 : WARUNKI */
tylko_sucho :- assertz(jezdzi(tylko_sucho)).
glownie_sucho :- assertz(jezdzi(glownie_sucho)).
czasem_mokro :- assertz(jezdzi(czasem_mokro)).
kazda_pogoda :- assertz(jezdzi(kazda_pogoda)).

/* kat.3 : POZIOM */
sportowo :- assertz(jezdzi(sportowo)).
amatorsko :- assertz(jezdzi(amatorsko)).

/* kat.4 : CZY MIASTO */
tylko_miasto :- assertz(jezdzi(tylko_miasto)).
czasem_miasto :- assertz(jezdzi(czasem_miasto)).
nigdy_miasto :- assertz(jezdzi(nigdy_miasto)).

/* kat.5 : WYGODA */
wygodnie :- assertz(jezdzi(wygodnie)).
szybko :- assertz(jezdzi(szybko)).


/*
kolo(28).
asfalt.
tylko_sucho.
sportowo.s
nigdy_miasto.
szybko.
*/
