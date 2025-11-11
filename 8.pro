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

8 ?- polozenie(T,C), gdzie('Sagrada Familia', T), miasto(T), panstwo(C), write(C
), fail.
Hiszpania
false.
*/     

% 8.4.1

zabytki_m(M) :-
    miasto(M),
    zabytek(Z),
    gdzie(Z, M),
    writeln(Z),
    fail.

zabytki_m(_) :-
    true.

/*
1 ?- zabytki_m('Berlin').
Brama Brandenburska
Reichstag
true.
*/

zabytki_mp(M) :-
    panstwo(P),
    miasto(M),
    zabytek(Z),
    polozenie(M, P),
    gdzie(Z, M),
    write(P), tab(1), write(M), tab(1), writeln(Z),
    fail.
zabytki_mp(_).

/*
1 ?- zabytki_mp('Berlin').
Niemcy Berlin Brama Brandenburska
Niemcy Berlin Reichstag
true.
*/

%  8.5

delta(A,B,C,D) :- D is B*B - 4*A*C.

trojmian(A, B, C, X) :-
    delta(A, B, C, D),
    D > 0,
    X1 is (-B - sqrt(D)) / (2 * A),
    X2 is (-B + sqrt(D)) / (2 * A),
    X = [X1, X2].
trojmian(A, B, C, X) :-
    delta(A, B, C, D),
    D = 0,
    X1 is (-B / 2 * A),
    X = [X1].
trojmian(A, B, C, X) :-
    delta(A, B, C, D),
    D < 0,
    X = [].

/*
4 ?- trojmian(1,0,1,X).
X = [].

5 ?- trojmian(1,-2,1,X).
X = [1] .

6 ?- trojmian(1,0,-1,X).
X = [-1.0, 1.0] ;
false.
*/

trojmian2(A, B, C, X) :-
    delta(A, B, C, D),
    D > 0,
    X1 is (-B - sqrt(D)) / (2 * A),
    X2 is (-B + sqrt(D)) / (2 * A),
    X = [X1, X2], !.
trojmian2(A, B, C, X) :-
    delta(A, B, C, D),
    D = 0,
    X1 is (-B / 2 * A),
    X = [X1], !.
trojmian2(_, _, _, []).


/*

7 ?- trojmian2(1,0,-1,X).
X = [-1.0, 1.0].

8 ?- trojmian2(1,-2,1,X).
X = [1].

9 ?- trojmian2(1,0,1,X).
X = [].

*/


