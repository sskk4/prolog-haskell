% 12.1.4

/*
Napisz program (w C i Javie ma byæ to odpowiednia funkcja), 
który wylicza liczbê wyst¹pieñ okreœlonego znaku w tablicy znaków.
*/

/*
1 ?- atom_chars("ola", L).
L = [o, l, a].
*/

count([], _, 0) :- !.

count([H|T], H, N) :-
  count(T, H, O),
  N is O + 1.

count([H|T], I, N) :-
  H \= I,
  count(T, I, N).

countChars(S, N, C) :-
  atom_chars(S, L),
  count(L, C, N), !.

count([H|T], I, N) :-
  count(T, H, O),
  N is O + 1.
