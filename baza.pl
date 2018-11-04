:- dynamic
         wymaga/1.
         rozmiar/2.
         psi_minimalne/1.
         psi_maksymalne/1.

opona(a) :- rozmiar(26, 2.4),
			psi(50,65),
			waga(1055).
opona(b) :- rozmiar(26, 2.4),
			psi(60,75),
			waga(750).

waga(X) :- X < 1000, wymaga(lekki).
waga(X) :- X > 800, wymaga(ciezki).
/*psi(_,_).*/
psi(X,Y):- psi_minimalne(A), psi_ok(X,A), psi_maksymalne(B), psi_ok(B,Y).

psi_ok(X,Y):- X >= Y.

gorski :- assertz(wymaga(lekki)).
kolo26 :- assertz(rozmiar(26, 2.4)).
ustaw_psi :- assertz(psi_minimalne(55)), assertz(psi_maksymalne(80)).


















