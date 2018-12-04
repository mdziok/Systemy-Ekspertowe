/* ------  SZOSOWE ------- */

/* -- grand-prix-4-season -- */
/* 32, 28, 25 */

/* https://www.continental-tires.com/bicycle/tires/race-tires/grand-prix-4-season */
opona(c_gp_4_season_32) :- rozmiar(28),
	szerokosc(32, szosowa),
    psi(85, 102, szosowa),
    waga(320, szosowa),
    bieznik(wyrazny),
    antyprzebicie(tak),
    typ(szosowa).

/* https://www.continental-tires.com/bicycle/tires/race-tires/grand-prix-4-season */
opona(c_gp_4_season_28) :- rozmiar(28),
	szerokosc(28, szosowa),
    psi(95, 115, szosowa),
    waga(280, szosowa),
    bieznik(wyrazny),
    antyprzebicie(tak),
    typ(szosowa).

/* https://www.continental-tires.com/bicycle/tires/race-tires/grand-prix-4-season */
opona(c_gp_4_season_25) :- rozmiar(28),
	szerokosc(25, szosowa),
    psi(95, 120, szosowa),
    waga(240, szosowa),
    bieznik(wyrazny),
    antyprzebicie(tak),
    typ(szosowa).

/* -- gatorskin -- */
/* 32_f, 25_f, 25 */

/* https://www.continental-tires.com/bicycle/tires/race-tires/gatorskin */
opona(c_gatorskin_32_f) :- rozmiar(28),
	szerokosc(32, szosowa),
    psi(85, 102, szosowa),
    waga(350, szosowa),
    bieznik(delikatny),
    antyprzebicie(tak),
    typ(szosowa).

/* https://www.continental-tires.com/bicycle/tires/race-tires/gatorskin */
opona(c_gatorskin_25_f) :- rozmiar(28),
	szerokosc(25, szosowa),
    psi(95, 120, szosowa),
    waga(240, szosowa),
    bieznik(delikatny),
    antyprzebicie(tak),
    typ(szosowa).

/* https://www.continental-tires.com/bicycle/tires/race-tires/gatorskin */
opona(c_gatorskin_25) :- rozmiar(28),
	szerokosc(25, szosowa),
    psi(95, 120, szosowa),
    waga(310, szosowa),
    bieznik(delikatny),
    antyprzebicie(tak),
    typ(szosowa).

/* -- ultra sport 2 -- */
/* 25, 25_f, 23, 23_f */

/* https://www.continental-tires.com/bicycle/tires/race-tires/ultra-sport2 */
opona(c_ultra_sport_25) :- rozmiar(28),
	szerokosc(25, szosowa),
    psi(100, 120, szosowa),
    waga(340, szosowa),
    bieznik(gladki),
    antyprzebicie(nie),
    typ(szosowa).

/* https://www.continental-tires.com/bicycle/tires/race-tires/ultra-sport2 */
opona(c_ultra_sport_25_f) :- rozmiar(28),
	szerokosc(25, szosowa),
    psi(100, 120, szosowa),
    waga(280, szosowa),
    bieznik(gladki),
    antyprzebicie(nie),
    typ(szosowa).

/* https://www.continental-tires.com/bicycle/tires/race-tires/ultra-sport2 */
opona(c_ultra_sport_23) :- rozmiar(28),
	szerokosc(23, szosowa),
    psi(110, 120, szosowa),
    waga(310, szosowa),
    bieznik(gladki),
    antyprzebicie(nie),
    typ(szosowa).

/* https://www.continental-tires.com/bicycle/tires/race-tires/ultra-sport2 */
opona(c_ultra_sport_23_f) :- rozmiar(28),
	szerokosc(23, szosowa),
    psi(110, 120, szosowa),
    waga(240, szosowa),
    bieznik(gladki),
    antyprzebicie(nie),
    typ(szosowa).

/* -- grand-prix-4-season -- */
/* 25_f, 28_f */

/* https://www.continental-tires.com/bicycle/tires/race-tires/grand-prix-4-season */
opona(c_grand_prix_25_f) :- rozmiar(28),
    szerokosc(25, szosowa),
    psi(95, 120, szosowa),
    waga(240, szosowa),
    bieznik(delikatny),
    antyprzebicie(tak),
    typ(szosowa).

/* https://www.continental-tires.com/bicycle/tires/race-tires/grand-prix-4-season */
opona(c_grand_prix_28_f) :- rozmiar(28),
    szerokosc(28, szosowa),
    psi(95, 115, szosowa),
    waga(280, szosowa),
    bieznik(delikatny),
    antyprzebicie(tak),
    typ(szosowa).


/* ------  TREKKINGOWE ------- */

/* -- contact -- */
/* 37, 42, 47 */

/* https://www.continental-tires.com/bicycle/tires/city-trekking-tires/contact */
opona(c_contact_37) :- rozmiar(28),
    szerokosc(37, trekkingowa),
    psi(56, 85, trekkingowa),
    waga(620, trekkingowa),
    bieznik(delikatny),
    antyprzebicie(tak),
    typ(trekkingowa).

/* https://www.continental-tires.com/bicycle/tires/city-trekking-tires/contact */
opona(c_contact_42) :- rozmiar(28),
    szerokosc(42, trekkingowa),
    psi(50, 85, trekkingowa),
    waga(710, trekkingowa),
    bieznik(delikatny),
    antyprzebicie(tak),
    typ(trekkingowa).

/* https://www.continental-tires.com/bicycle/tires/city-trekking-tires/contact */
opona(c_contact_47) :- rozmiar(28),
    szerokosc(47, trekkingowa),
    psi(45, 58, trekkingowa),
    waga(810, trekkingowa),
    bieznik(delikatny),
    antyprzebicie(tak),
    typ(trekkingowa).

/* -- ride tour -- */
/* 37, 42, 47 */

/* https://www.continental-tires.com/bicycle/tires/city-trekking-tires/ride-tour */
opona(c_ride_42) :- rozmiar(28),
    szerokosc(42, trekkingowa),
    psi(50, 65, trekkingowa),
    waga(725, trekkingowa),
    bieznik(wyrazny),
    antyprzebicie(tak),
    typ(trekkingowa).

/* https://www.continental-tires.com/bicycle/tires/city-trekking-tires/ride-tour */
opona(c_ride_37) :- rozmiar(28),
    szerokosc(37, trekkingowa),
    psi(56, 70, trekkingowa),
    waga(655, trekkingowa),
    bieznik(wyrazny),
    antyprzebicie(tak),
    typ(trekkingowa).

/* https://www.continental-tires.com/bicycle/tires/city-trekking-tires/ride-tour */
opona(c_ride_47) :- rozmiar(28),
    szerokosc(47, trekkingowa),
    psi(45, 58, trekkingowa),
    waga(910, trekkingowa),
    bieznik(wyrazny),
    antyprzebicie(tak),
    typ(trekkingowa).



/* ------  MTB ------- */

/* https://www.continental-tires.com/bicycle/tires/mountainbike-tires/vapor-2-1 */
opona(c_vapor_2_1) :- rozmiar(26),
    szerokosc(54, gorska),
    psi(50, 65, gorska),
    waga(715, gorska),
    bieznik(wyrazny),
    antyprzebicie(nie),
    typ(gorska).

/* https://www.continental-tires.com/bicycle/tires/mountainbike-tires/cross-king-racesport */
opona(c_cross_king_racesport_2_3) :- rozmiar(26),
    szerokosc(58, gorska),
    psi(44, 54, gorska),
    waga(600, gorska),
    bieznik(delikatny),
    antyprzebicie(nie),
    typ(gorska).

/* https://www.continental-tires.com/bicycle/tires/mountainbike-tires/mud-king-protection-apex */
opona(c_mud_king_2_3) :- rozmiar(26),
    szerokosc(57, gorska),
    psi(45, 65, gorska),
    waga(1100, gorska),
    bieznik(agresywny),
    antyprzebicie(nie),
    typ(gorska).

/* https://www.continental-tires.com/bicycle/tires/mountainbike-tires/der-baron-2-4-projekt */
opona(c_der_baron_2_4) :- rozmiar(26),
    szerokosc(60, gorska),
    psi(36, 51, gorska),
    waga(900, gorska),
    bieznik(agresywny),
    antyprzebicie(nie),
    typ(gorska).

/* https://www.continental-tires.com/bicycle/tires/mountainbike-tires/double-fighter-3 */
opona(c_double_fighter_III_1_9) :- rozmiar(26),
    szerokosc(50, gorska),
    psi(50, 65, gorska),
    waga(800, gorska),
    bieznik(delikatny),
    antyprzebicie(tak),
    typ(gorska).
