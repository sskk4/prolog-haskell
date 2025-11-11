rodzic(ola,max).     % parent  P ~ K
rodzic(tomek,max).
rodzic(tomek,lila).
rodzic(max,ania).
rodzic(max,kasia).
rodzic(kasia,radek).

kobieta(ola).        % woman  W
kobieta(lila).
kobieta(kasia).
kobieta(ania).

mezczyzna(tomek).    % man  M
mezczyzna(max).
mezczyzna(radek).

% rules

matka(X,Y) :-        % mother(X,Y)  M ~ K
  rodzic(X,Y),
  kobieta(X).

ojciec(X,Y) :-       % father(X,Y)  F ~ K
  rodzic(X,Y),
  mezczyzna(X).

/*

1 ?- true, true.
true.

2 ?- false, true.
false.

3 ?- true, false.
false.

4 ?- false, false.
false.

5 ?- true; true.
true .

6 ?- true; true.
true ;
true.

6 ?- false; true.
true.

7 ?- true; false.
true ;
false.

8 ?- false; false.
false.

9 ?- lub.
true ;
true.

10 ?- lub2.
true ;
true.
*/

% 7.1

% Czy Tomek jest mê¿czyzn¹?

/*
1 ?- mezczyzna(tomek).
true.
*/

% Czy Tomek jest kobiet¹?

/*
2 ?- kobieta(tomek).
false.
*/

% Kto jest rodzicem Maxa?

/*
2 ?- rodzic(R, max).
R = ola ;
R = tomek.
*/

% Czyim rodzicem jest Max?

/*
3 ?- rodzic(max, D).
D = ania ;
D = kasia.
*/

% Czy Ola jest matk¹?

/*
5 ?- matka(ola, _).
true.
*/

% Czy Ola ma matkê?

/*
6 ?- matka(_, ola).
false.
*/

% Czy Tomek ma dzieci?

/*
9 ?- rodzic(tomek, _).
true ;
true.
*/

% Czy Ania ma matkê i ojca?

/*
10 ?- matka(_, ania), ojciec(_, ania).
false.
*/

% Kto ma wnuka? (bez dodawania nowych regu³)

/*
12 ?- rodzic(G, P), rodzic(P, D), mezczyzna(D)
G = max,
P = kasia,
D = radek ;
false.
*/

%7.2

panstwo('Polska').
panstwo('Niemcy').
panstwo('Francja').
panstwo('W³ochy').
panstwo('Hiszpania').
panstwo('Wielka Brytania').

miasto('Warszawa').
miasto('Kraków').
miasto('Berlin').
miasto('Pary¿').
miasto('Rzym').
miasto('Wenecja').
miasto('Barcelona').
miasto('Madryt').
miasto('Londyn').

polozenie('Warszawa', 'Polska').
polozenie('Kraków', 'Polska').
polozenie('Berlin', 'Niemcy').
polozenie('Pary¿', 'Francja').
polozenie('Rzym', 'W³ochy').
polozenie('Wenecja', 'W³ochy').
polozenie('Barcelona', 'Hiszpania').
polozenie('Madryt', 'Hiszpania').
polozenie('Londyn', 'Wielka Brytania').

zabytek('Pa³ac w Wilanowie').
zabytek('Kolumna Zygmunta III Wazy').
zabytek('Wawel').
zabytek('Sukiennice').
zabytek('Koœció³ Mariacki').
zabytek('Brama Brandenburska').
zabytek('Reichstag').
zabytek('Wie¿a Eiffla').
zabytek('Katedra Notre-Dame').
zabytek('Pa³ac Elizejski').
zabytek('Bazylika œw. Paw³a za Murami').
zabytek('Koloseum').
zabytek('Zamek Œwiêtego Anio³a').
zabytek('Bazylika œw. Marka').
zabytek('Pa³ac Do¿ów').
zabytek('Sagrada Familia').
zabytek('Pa³ac Kryszta³owy').
zabytek('Tower Bridge').
zabytek('Pa³ac Buckingham').
zabytek('Katedra Œwiêtego Paw³a').

gdzie('Pa³ac w Wilanowie', 'Warszawa').
gdzie('Kolumna Zygmunta III Wazy', 'Warszawa').
gdzie('Wawel', 'Kraków').
gdzie('Sukiennice', 'Kraków').
gdzie('Koœció³ Mariacki', 'Kraków').
gdzie('Brama Brandenburska', 'Berlin').
gdzie('Reichstag', 'Berlin').
gdzie('Wie¿a Eiffla', 'Pary¿').
gdzie('Katedra Notre-Dame', 'Pary¿').
gdzie('Pa³ac Elizejski', 'Pary¿').
gdzie('Bazylika œw. Paw³a za Murami', 'Rzym').
gdzie('Koloseum', 'Rzym').
gdzie('Zamek Œwiêtego Anio³a', 'Rzym').
gdzie('Bazylika œw. Marka', 'Wenecja').
gdzie('Pa³ac Do¿ów', 'Wenecja').
gdzie('Sagrada Familia', 'Barcelona').
gdzie('Pa³ac Kryszta³owy', 'Madryt').
gdzie('Tower Bridge', 'Londyn').
gdzie('Pa³ac Buckingham', 'Londyn').
gdzie('Katedra Œwiêtego Paw³a', 'Londyn').

obok('Polska', 'Niemcy').
obok('Niemcy', 'Francja').
obok('Francja', 'Wielka Brytania').
obok('Francja', 'W³ochy').
obok('Francja', 'Hiszpania').

% Jakie zabytki znajduj¹ siê w Berlinie?

/*
2 ?- gdzie(M, 'Berlin'), zabytek(M).
M = 'Brama Brandenburska' ;
M = 'Reichstag'.
*/


% Jakie miasta znajduj¹ siê w Hiszpani?

/*
4 ?- polozenie(T, 'Hiszpania'), miasto(T).
T = 'Barcelona' ;
T = 'Madryt'.
*/

% Jakie zabytki znajduj¹ siê we W³oszech?

/*
5 ?- gdzie(M, T), polozenie(T, 'W³ochy'), zabytek(M), miasto(T).
M = 'Bazylika œw. Paw³a za Murami',
T = 'Rzym' ;
M = 'Koloseum',
T = 'Rzym' ;
M = 'Zamek Œwiêtego Anio³a',
T = 'Rzym' ;
M = 'Bazylika œw. Marka',
T = 'Wenecja' ;
M = 'Pa³ac Do¿ów',
T = 'Wenecja' ;
false.
*/

% W jakim mieœcie znajduje siê Bazylika œw. Paw³a za Murami?

/*
6 ?- gdzie('Bazylika œw. Paw³a za Murami', T), miasto(T).
T = 'Rzym'.
*/

% W jakim pañstwie jest Sagrada Familia?

/*
7 ?- polozenie(T,C), gdzie('Sagrada Familia', T), miasto(T), panstwo(C).
T = 'Barcelona',
C = 'Hiszpania' .
*/

% Jakie zabytki mo¿na zwiedzaæ w Pañstwach s¹siaduj¹cych z Francj¹?

/*

8 ?- polozenie(T,C), gdzie('Sagrada Familia', T), miasto(T), panstwo(C), write(C)
), fail.
Hiszpania
false.
*/


sasiad(C1, C2) :- obok(C1, C2) ; obok(C2, C1).

/*
2 ?- sasiad('Francja', C), polozenie(T, C), gdzie(M, T), zabytek(M), miasto(T),
panstwo(C).
C = 'Wielka Brytania',
T = 'Londyn',
M = 'Tower Bridge' ;
C = 'Wielka Brytania',
T = 'Londyn',
M = 'Pa³ac Buckingham' ;
C = 'Wielka Brytania',
T = 'Londyn',
M = 'Katedra Œwiêtego Paw³a' ;
C = 'W³ochy',
T = 'Rzym',
M = 'Bazylika œw. Paw³a za Murami' ;
C = 'W³ochy',
T = 'Rzym',
M = 'Koloseum' ;
C = 'W³ochy',
T = 'Rzym',
M = 'Zamek Œwiêtego Anio³a' ;
C = 'W³ochy',
T = 'Wenecja',
M = 'Bazylika œw. Marka' ;
C = 'W³ochy',
T = 'Wenecja',
M = 'Pa³ac Do¿ów' ;
C = 'Hiszpania',
T = 'Barcelona',
M = 'Sagrada Familia' ;
C = 'Hiszpania',
T = 'Madryt',
M = 'Pa³ac Kryszta³owy' ;
C = 'Niemcy',
T = 'Berlin',
M = 'Brama Brandenburska' ;
C = 'Niemcy',
T = 'Berlin',
M = 'Reichstag'.
*/


sasiad2(C1, C2) :- obok(C1, C2).
sasiad2(C1, C2) :- obok(C2, C1).

/*
2 ?- sasiad2('Francja', C), polozenie(T, C), gdzie(M, T), zabytek(M), miasto(T),
 panstwo(C).
C = 'Wielka Brytania',
T = 'Londyn',
M = 'Tower Bridge' ;
C = 'Wielka Brytania',
T = 'Londyn',
M = 'Pa³ac Buckingham' ;
C = 'Wielka Brytania',
T = 'Londyn',
M = 'Katedra Œwiêtego Paw³a' ;
C = 'W³ochy',
T = 'Rzym',
M = 'Bazylika œw. Paw³a za Murami' ;
C = 'W³ochy',
T = 'Rzym',
M = 'Koloseum' ;
C = 'W³ochy',
T = 'Rzym',
M = 'Zamek Œwiêtego Anio³a' ;
C = 'W³ochy',
T = 'Wenecja',
M = 'Bazylika œw. Marka' ;
C = 'W³ochy',
T = 'Wenecja',
M = 'Pa³ac Do¿ów' ;
C = 'Hiszpania',
T = 'Barcelona',
M = 'Sagrada Familia' ;
C = 'Hiszpania',
T = 'Madryt',
M = 'Pa³ac Kryszta³owy' ;
C = 'Niemcy',
T = 'Berlin',
M = 'Brama Brandenburska' ;
C = 'Niemcy',
T = 'Berlin',
M = 'Reichstag'.
*/



