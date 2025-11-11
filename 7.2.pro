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