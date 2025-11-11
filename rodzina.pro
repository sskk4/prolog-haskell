% facts

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
Relations:

parent  P ~ K

Properties:

woman  W
man    M

Predicates:

mother(X,Y)  M ~ K
father(X,Y)  F ~ K
*/

% 8.1.1
siostra(X, Y) :-
  kobieta(X),
  rodzic(P, X),
  rodzic(P, Y),
  X \= Y.


/*
1 ?- siostra(ola, lila).
false.

2 ?- siostra(lila, max).
true.

3 ?- siostra(lila, lila).
false.


*/

% Task 1.2
siostra2(X, Y) :-
  X \= Y,
  kobieta(X),
  rodzic(P, X),
  rodzic(P, Y).
  
/*
7 ?- siostra2(S, R).
false.
*/

%8.1.2
para(X, Y) :-
  kobieta(X),
  mezczyzna(Y),
  rodzic(X, K),
  rodzic(Y, K).
  
/*
10 ?- para(X,Y).
X = ola,
Y = tomek ;
false.
*/

%8.2
rodzice(X) :-
  ojciec(F, X),
  matka(M, X),
  write('ojciec: '), writeln(F),
  write('matka: '), writeln(M), !.

rodzice(X) :-
  ojciec(F, X),
  write('ojciec: '), writeln(F), !.

rodzice(X) :-
  matka(M, X),
  write('matka: '), writeln(M), !.

rodzice(_) :-
  writeln('brak danych').
   
/*
14 ?- rodzice(max).
ojciec: tomek
matka: ola
true.

15 ?- rodzice(lila).
ojciec: tomek
true.

16 ?- rodzice(radek).
matka: kasia
true.

17 ?- rodzice(ola).
brak danych
true.
*/

% 8.3.1

/*
X is the descendant of Y.

X <- Y
X <- Z <- Y
 \__/ \__/

X <- ... <- Y
*/

potomek(X, Y) :- rodzic(Y, X).
potomek(X, Y) :- rodzic(Y, Z), potomek(X, Z).

/*
1 ?- potomek(ola, tomek).
false.

2 ?- potomek(radek, tomek).
true ;
false.
*/

/* Task 2

1. Na ile sposobow mozna okreslic regule potomek? odp: Na dwa sposoby.

2. Podaj wszystkie mozliwe rozwiazania dla reguly potomek. odp.

3. Are the rules descendant(X,Y) and descendant2(X,Y) equivalent?
*/

potomek2(X, Y) :- rodzic(Y, X).
potomek2(X, Y) :- rodzic(Z, X), potomek2(Z, Y).

/*
1 ?- potomek(X, Y).      3 ?- potomek2(X,Y).
X = max,                 X = max,            
Y = ola ;                Y = ola ;           
X = max,                 X = max,
Y = tomek ;              Y = tomek ;         
X = lila,                X = lila,           
Y = tomek ;              Y = tomek ;         
X = ania,                X = ania,           
Y = max ;                Y = max ;           
X = kasia,               X = kasia,          
Y = max ;                Y = max ;           
X = radek,               X = radek,          
Y = kasia ;              Y = kasia ;         
X = ania,                X = ania,           
Y = ola ;                Y = ola ;           
X = kasia,               X = ania,           
Y = ola ;                Y = tomek ;
X = radek,               X = kasia,          
Y = ola ;                Y = ola ;           
X = ania,                X = kasia,          
Y = tomek ;              Y = tomek ;
X = kasia,               X = radek,          
Y = tomek ;              Y = max ;           
X = radek,               X = radek,          
Y = tomek ;              Y = ola ;           
X = radek,               X = radek,
Y = max ;                Y = tomek ;         
false.                   false.
*/
