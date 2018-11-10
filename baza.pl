:- dynamic
         wymaga/1.
         rozmiar/1.
         szerokosc/1.
         psi_minimalne/1.
         psi_maksymalne/1.
         typ/1.

/* https://www.continental-tires.com/bicycle/tires/race-tires/gatorskin */
opona(c_gatorskin) :- rozmiar(28),
	szerokosc(0.25, szosowa),
    psi(95,120),
    waga(310, szosowa),
    bieznik(delikatny),
    antyprzebicie(tak),
    typ(szosowa).

/* https://www.continental-tires.com/bicycle/tires/race-tires/ultra-sport2 */
opona(c_ultra_sport) :- rozmiar(28),
	szerokosc(0.25, szosowa),
    psi(95,120),
    waga(340, szosowa),
    bieznik(gladki),
    antyprzebicie(nie),
    typ(szosowa).

/* https://www.continental-tires.com/bicycle/tires/race-tires/grand-prix-4-season */
opona(c_grand_prix) :- rozmiar(28),
    szerokosc(0.25, szosowa),
    psi(95,120),
    waga(225, szosowa),
    bieznik(delikatny),
    antyprzebicie(tak),
    typ(szosowa).

/* https://www.continental-tires.com/bicycle/tires/city-trekking-tires/contact */
opona(c_contact) :- rozmiar(28),
    szerokosc(0.37, trekkingowa),
    psi(56,85),
    waga(620, trekkingowa),
    bieznik(delikatny),
    antyprzebicie(tak),
    typ(trekkingowa).

/* https://www.continental-tires.com/bicycle/tires/city-trekking-tires/ride-tour */
opona(c_ride) :- rozmiar(28),
    szerokosc(0.42, trekkingowa),
    psi(50,62),
    waga(720, trekkingowa),
    bieznik(wyrazny),
    antyprzebicie(tak),
    typ(trekkingowa).

/* wnioskujemy, czy podana waga opony jest w porządku */
/* dopracowac wartosci */
waga(X, trekkingowa) :- X < 1000, wymaga(lekki).
waga(X, szosowa) :- X < 1000, wymaga(lekki).
waga(X, trekkingowa) :- X > 800, wymaga(ciezki).
waga(X, szosowa) :- X > 800, wymaga(ciezki).

/* wnioskujemy, czy podana szerokosc opony jest w porządku */
/* dopracowac wartosci */
szerokosc(X, trekkingowa) :- X < 0.3, wymaga(cienki).
szerokosc(X, trekkingowa) :- X > 0.3, wymaga(szeroki).
szerokosc(X, szosowa) :- X < 0.3, wymaga(cienki).
szerokosc(X, szosowa) :- X > 0.3, wymaga(szeroki).

/* wnioskujemy, czy podane psi jest w porzadku */
/* dopracowac wartosci */
psi(X, Y) :- X > 50, Y < 80, wymaga(male_psi).
psi(X, Y) :- X > 70, Y < 100, wymaga(srednie_psi).
psi(X, Y) :- X > 90, Y < 130, wymaga(duze_psi).


/* jakiego bieznika potrzebujemy */
bieznik(wyrazny) :- jezdzi(wyczynowo).
bieznik(delikatny) :- jezdzi(wyczynowo).
bieznik(gladki) :- jezdzi(wyczynowo).

/* jakiego typu opony poszukujemy */
typ(szosowy) :- jezdzi(szosa).
typ(trekkingowa) :- jezdzi(szosa).

/* czy potrzebujemy antyprzebicia */
antyprzebicie(nie) :- (jezdzi(nigdy_miasto).


/* czego wymagamy od opony na podstawie zależności od użytkownika */
/* dopracować wnioskowanie!!! */
wymaga(lekki) :- jezdzi(wyczynowo).
wymaga(ciezki) :- jezdzi(wyczynowo).
wymaga(cienki) :- jezdzi(wyczynowo).
wymaga(szeroki) :- jezdzi(wyczynowo).
wymaga(male_psi) :- jezdzi(wyczynowo).
wymaga(srednie_psi) :- jezdzi(wyczynowo).
wymaga(duze_psi) :- jezdzi(wyczynowo).


/* PrzykĹ‚adowe pytania:
- po jakim terenie siÄ™ poruszasz przede wszystkim? asfalt - szuter - teren - bezdroĹĽa
- w jakich warunkach jeĹşdzisz? tylko suche - gĹ‚Ăłwnie suche, czasem mokro - niezaleĹĽnie
- czy jeĹşdzisz sportowo? tak - nie
- czy lubisz wygodnÄ… jazdÄ™ ? tak - nie
- czy jeĹşdzisz po mieĹ›cie? tak - czasem - nie
- co preferujesz? spokojne przemieszczanie siÄ™ - jazda na czas
*/


/* dane, jakie otrzymamy od uzytkownika */
kolo(X) :- assertz(rozmiar(X)).

asfalt :- assertz(jezdzi(asfalt)).
szuter :- assertz(jezdzi(szuter)).
teren :- assertz(jezdzi(teren)).
bezdroza :- assertz(jezdzi(bezdroza)).

tylko_sucho :- assertz(jezdzi(tylko_sucho)).
glownie_sucho :- assertz(jezdzi(glownie_sucho)).
czasem_mokro :- assertz(jezdzi(czasem_mokro)).
kazda_pogoda :- assertz(jezdzi(kazda_pogoda)).

sportowo :- assertz(jezdzi(sportowo)).
nie_sportowo :- assertz(jezdzi(nie_sportowo)).

tylko_miasto :- assertz(jezdzi(tylko_miasto)).
czasem_miasto :- assertz(jezdzi(czasem_miasto)).
nigdy_miasto :- assertz(jezdzi(nigdy_miasto)).

spokojna_jazda :- assertz(jezdzi(spokojna_jazda)).
jazda_na_czas :- assertz(jezdzi(jazda_na_czas)).


