:- dynamic
         wymaga/1.
         rozmiar/2.
         psi_minimalne/1.
         psi_maksymalne/1.

/* https://www.continental-tires.com/bicycle/tires/race-tires/gatorskin */
opona(c_gatorskin) :- rozmiar(28, 0.25),
    psi(95,120),
    waga(310),
    bieznik(delikatny),
    posiada(antyprzebicie),
    jest(szosowa).

/* https://www.continental-tires.com/bicycle/tires/race-tires/ultra-sport2 */
opona(c_ultra_sport) :- rozmiar(28, 0.25),
    psi(95,120),
    waga(340),
    bieznik(gladki),
    jest(szosowa).

/* https://www.continental-tires.com/bicycle/tires/race-tires/grand-prix-4-season */
opona(c_grand_prix) :- rozmiar(28, 0.25),
    psi(95,120),
    waga(225),
    bieznik(delikatny),
    posiada(antyprzebicie),
    jest(szosowa).

/* https://www.continental-tires.com/bicycle/tires/city-trekking-tires/contact */
opona(c_contact) :- rozmiar(28, 0.37),
    psi(56,85),
    waga(620),
    bieznik(delikatny),
    posiada(antyprzebicie),
    jest(trekkingowa).

/* https://www.continental-tires.com/bicycle/tires/city-trekking-tires/ride-tour */
opona(c_ride) :- rozmiar(28, 0.42),
    psi(50,62),
    waga(720),
    bieznik(wyrazny),
    posiada(antyprzebicie),
    jest(trekkingowa).


waga(X) :- X < 1000, wymaga(lekki).
waga(X) :- X > 800, wymaga(ciezki).
/*psi(_,_).*/
psi(X,Y):- psi_minimalne(A), psi_ok(X,A), psi_maksymalne(B), psi_ok(B,Y).

psi_ok(X,Y):- X >= Y.

kolo26 :- assertz(rozmiar(26, _)).
kolo28 :- assertz(rozmiar(28, _)).

/* dodac rozmiar > 0.4 */
szeroka_opona :- assertz(jest(trekkingowa)).

/* dodac rozmiar > 2.2 */
szeroka_opona :- assertz(jest(gorska)).


szosowy :- assertz(jest(szosowa), kolo28).
trekking :- assertz(jest(trekkingowa), kolo28).
gorski :- assertz(jest(gorska)).

jazda_w_deszczu :- assertz(jest(szosowa), bieznik(delikatny)).
jazda_w_deszczu :- assertz(jest(trekkingowa)).
jazda_w_deszczu :- assertz(jest(gorska)).

jazda_wyczynowa :- assertz(jest(szosowa), bieznik(gladki), wymaga(lekka_szosa)).
jazda_wyczynowa :- assertz(jest(gorska), bieznik(agresywny), wymaga(lekka_gorska)).

jazda_szybka :- assertz(jest(trekkingowa), psi_minimalne(70)).
jazda_wygodna :- assertz(jest(trekkingowa), szeroka_opona)

ustaw_psi :- assertz(psi_minimalne(55)), assertz(psi_maksymalne(80)).

/* Przykładowe pytania:
- po jakim terenie się poruszasz przede wszystkim? asfalt - szuter - teren - bezdroża
- w jakich warunkach jeździsz? tylko suche - głównie suche, czasem mokro - niezależnie
- czy jeździsz sportowo? tak - nie
- czy lubisz wygodną jazdę ? tak - nie
- czy jeździsz po mieście? tak - czasem - nie
- co preferujesz? spokojne przemieszczanie się - jazda na czas
*/
