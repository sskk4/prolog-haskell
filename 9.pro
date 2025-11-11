% 9.1

/*

W pliku listy.pl zdefiniuj predykat take/3 pobieraj¹cy N pocz¹tkowych elementów z listy. Argumenty:

liczba naturalna,
lista pocz¹tkowa,
lista wynikowa.
Uwaga: Nale¿y rozpatrzeæ dwa warunki koñcowe: pobieranie z pustej listy i pobieranie „0“ elementów.

*/

test(X,X).

/*

1 ?- test(5,X).
X = 5.

2 ?- test(X,6).
X = 6.

3 ?- test(5,5).
true.

4 ?- test(6,5).
false.

*/

test2(X,Y) :- X = Y.

/*

1 ?- test2(5,X).
X = 5.

2 ?- test2(X,6).
X = 6.

3 ?- test2(5,5).
true.

4 ?- test2(6,5).
false.

*/

% 9.1

/*
W pliku listy.pl zdefiniuj prefykat take/3 pobieraj¹cy
Argumenty:

liczba naturalna,
lista pocz¹tkowa,
lista wynikowa.

Uwaga: Nale¿y rozpatrzeæ dwa warunki koñcowe:
pobieranie z pustej listy i pobieranie "0" elementów
*/

take(_, [], []) :- !.
take(0, _, []) :- !.
take(N, [H|T],[H|L]) :-
  M is N-1,
  take(M, T, L).

/*
1. Przebieg z gory do do³u                     2. Przebieg z gory do do³u

* 1 take(2,[a, b, c, d],X) =>                  * 1 take(2,[a, b, c, d],X) => X = [a, b]
  N = 2                                          N = 2
  [H|T] = [a, b, c, d] => H = a, T = [b, c, d].  [H|T] = [a, b, c, d] => H = a, T =[b, c, d].
  X := [H|L] = [a|L] =                           X := [H|L] = [a|L] = [a|[b]] = [a, b]
  :-                                             :-
  M is 2-1 = 1                                   M is 2-1 = 1
  2 take(1, [b, c, d], L) =>                     2 take(1, [b, c, d], L) => [b]

* 2 take(1, [b, c, d], L) =>                   * 2 take(1, [b, c, d], L) => [b]
  N = 1                                          N = 1
  [H|T] = [b, c, d] => H = b, T =[c, d].         [H|T] = [b, c, d] => H = b, T =[c, d].
  L := [H|L] = [b|L] =                           L := [H|L] = [b|L] = [b|[]] = [b]
  :-                                             :-
  M is 1-1 = 0                                   M is 1-1 = 0
  3 take(0, [c, d], L) =>                        3 take(0, [c, d], L) => L = []

* 3 take(0, [c, d], L) =>                      * 3 take(0, [c, d], L) => L = []
  0 = 0                                          0 = 0
  _ = 0                                          _ = 0
  L := []                                        L := []

*/

/*
[trace] 1 ?- take(2,[a,b,c,d],X).
   Call: (12) take(2, [a, b, c, d], _10676) ? creep
   Call: (13) _12048 is 2+ -1 ? creep
   Exit: (13) 1 is 2+ -1 ? creep
   Call: (13) take(1, [b, c, d], _12040) ? creep
   Call: (14) _14496 is 1+ -1 ? creep
   Exit: (14) 0 is 1+ -1 ? creep
   Call: (14) take(0, [c, d], _14488) ? creep
   Exit: (14) take(0, [c, d], []) ? creep
   Exit: (13) take(1, [b, c, d], [b]) ? creep
   Exit: (12) take(2, [a, b, c, d], [a, b]) ? creep
*/

/*

2 ?- take(3,[],X).
X = [].

3 ?- take(0,[a,b,c],X).
X = [].

4 ?- take(1,[a,b,c],X).
X = [a].

5 ?- take(2,[a,b,c,d],X).
X = [a, b].

*/

% 9.3.1

/*
W pliku listy.pl zdefiniuj predykat init/2 pobieraj¹cy z listy L wszystkie elementy poza ostatnim. Pierwszym argumentem predykatu jest lista wejœciowa, a drugim wynik. Podaj dwie definicje tego predykatu:

z zastosowaniem predykatu reverse;
*/

/*
L          R          T        I
[a,b,c] -> [c,b,a] -> [b,a] -> [a,b]
*/

init2(L, I) :-
  reverse(L,R),
  R = [_|T],
  reverse(T,I).
  
/*
1 ?- init2([a,b,c],I).
I = [a, b].

2 ?- init2([a],I).
I = [].

3 ?- init2([],I).
false.
*/

init(L, I) :-
  reverse(L,[_|T]),
  reverse(T,I).
  
/*

5 ?- init([a,b,c],I).
I = [a, b].

6 ?- init([a],I).
I = [].

7 ?- init([],I).
false.

*/

% 9.4

/*

W pliku listy.pl zdefiniuj predykat middle/2 pobieraj¹cy z listy L wszystkie elementy poza pierwszym i ostatnim. Pierwszym argumentem predykatu jest lista wejœciowa, a drugim wynik.

*/

/*

L                T           M
[a, b, c, d] -> [b, c, d] -> [b, c]

*/

middle2(L, M) :-
  L = [_|T],
  init(T,M).
  
/*
1 ?- middle2([a,b,c,d], X).
X = [b, c].
*/

middle([_|T], M) :-
  init(T, M).
  
/*

3 ?- middle([a,b,c,d], X).
X = [b, c].

4 ?- middle([a,b], X).
X = [].

5 ?- middle([a], X).
false.

*/

% 9.6

% permutation(P, L) -  P jest permutacj¹ listy L

/*
1 ?- append([a, b], [c, d], X).
X = [a, b, c, d].

2 ?- append(X, Y, [a, b, c]).
X = [],
Y = [a, b, c] ;
X = [a],
Y = [b, c] ;
X = [a, b],
Y = [c] ;
X = [a, b, c],
Y = [] ;
false.
*/

permutation([], []).

permutation(P, [H|T]) :-
    permutation(P1, T),        
    append(A, B, P1),      % P1 dzielimy na dwie czêœci 
    append(A, [H|B], P).   % P powstaje poprzez wstawienie 
                           % elementu H w pewne miejsce listy P1
                           
/*
3 ?- permutation(P, [a, b, c]).
P = [a, b, c] ;
P = [b, a, c] ;
P = [b, c, a] ;
P = [a, c, b] ;
P = [c, a, b] ;
P = [c, b, a] ;
false.
*/

% 9.9

/*
4 ?- numlist(1, 5, X).
X = [1, 2, 3, 4, 5].
*/

f1(X,Y) :- Y is 1/X.

listSum([X], X).
listSum([X,Y|T], Sum) :-
  Z is X + Y,
  listSum([Z|T], Sum).
  
s1(X) :-
  numlist(1, 100, L1),
  maplist(f1, L1, L2),
  listSum(L2, X), !.
  
/*
7 ?- s1(X).
X = 5.187377517639621.
*/

f2(X,Y) :- Y is (1+X)/(2+X).

listProd([X], X).
listProd([X,Y|T], Prod) :-
  Z is X * Y,
  listProd([Z|T], Prod).

p1(X) :-
  numlist(1, 50, L1),
  maplist(f2, L1, L2),
  listProd(L2, X), !.
  
/*
1 ?- p1(X).
X = 0.03846153846153846.
*/










