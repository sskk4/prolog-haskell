/*
Napisz program wyznaczaj¹cy 9-cyfrowy szyfr do sejfu. Dane s¹ nastêpuj¹ce wskazówki:

pierwsza cyfra jest sum¹ czwartej i pi¹tej,
druga cyfra jest podwojon¹ szóst¹,
trzecia cyfra nie dzieli siê przez 5,
czwarta cyfra dzieli siê tylko przez 1,
szósta cyfra jest o 2 mniejsza od ósmej,
siódma cyfra dzieli siê przez 3,
ósma cyfra jest podwojon¹ pierwsz¹,
dziewi¹ta cyfra jest o jeden mniejsza od ósmej,
kod nie zawiera cyfr 0 i 9.
*/
   /*
cyfra(1).
cyfra(2).
cyfra(3).
cyfra(4).
cyfra(5).
cyfra(6).
cyfra(7).
cyfra(8).

kod1(L) :-
  cyfra(C4), C4 = 1,
  cyfra(C3), C3 mod 5 > 0,
  cyfra(C7), C7 mod 3 =:= 0,
  cyfra(C5),
  cyfra(C1), C1 =:= C4 + C5,
  cyfra(C8), C8 =:= C1 * 2,
  cyfra(C9), C9 =:= C8 - 1,
  cyfra(C6), C6 =:= C8 - 2,
  cyfra(C2), C2 :=: C6 * 2,
  L = [C1, C2, C3, C4, C5, C6, C7, C8, C9].
  
kod2 :-
  cyfra(C4), C4 = 1,
  cyfra(C3), C3 mod 5 > 0,
  cyfra(C7), C7 mod 3 =:= 0,
  cyfra(C5),
  cyfra(C1), C1 =:= C4 + C5,
  cyfra(C8), C8 =:= C1 * 2,
  cyfra(C9), C9 =:= C8 - 1,
  cyfra(C6), C6 =:= C8 - 2,
  cyfra(C2), C2 :=: C6 * 2,
  L = [C1, C2, C3, C4, C5, C6, C7, C8, C9],
  writeln(L),
  fail.
          */
% 10.2


assign([], _).
assign([V|Vs], L1):-
    select(V, L1, L2),
    assign(Vs, L2).


perm3() :-
  P = [X1, X2, X3],
  L = [1, 2, 3],
  assign(P, L),
  % conditions
  writeln(P),
  fail.


kwadrat1 :-
  X = [X00, X01,      X03,
            X11, X12,
       X20, X21,
                 X32, X33],
  L = [4, 6, 7, 8, 9, 10, 13, 14, 16],
  assign(X, L),
  X00 + X01 + 5   + X03 =:= 34,
  15  + X11 + X12 + 3   =:= 34,
  X20 + X21 + 11  + 2   =:= 34,
  1   + 12  + X32 + X33 =:= 34,
  X00 + 15  + X20 + 1   =:= 34,
  X01 + X11 + X21 + 12  =:= 34,
  5   + X12 + 11  + X32 =:= 34,
  X03 + 3   + 2   + X33 =:= 34,
  writeln(X),
  fail.

  /*
  3 ?- kwadrat1.
[4,9,16,6,10,14,7,8,13]
false.


  */
  
  %10.4

  /*
  Napisz program w Prologu rozszyfrowuj¹cy dzia³anie wiedz¹c, ¿e takim samym literom odpowiadaj¹ takie same cyfry, a ró¿nym literom ró¿ne cyfry.

AB +  C = DD
 +    + =  +
DE +  C = DC
------------
FB + AE = GB
  */

rownanie :-
  X = [A,B,C,D,E,F,G],
  Digits = [0,1,2,3,4,5,6,7,8,9],
  assign(X, Digits),
  A > 0,
  D > 0,
  F > 0,
  G > 0,
  A*10 + B + C =:= D*10 + D,
  D*10 + E + C =:= D*10 + C,
  F*10 + B + A*10 + E =:= G*10 + B,
  A*10 + B + D*10 + E =:= F*10 + B,
  C + C =:= A*10 + E,
  D*10 + D + D*10 + C =:= G*10 + B,
  writeln(X),
  fail.


 /*

1 ?- rownanie.
[1,7,5,2,0,3,4]
false.


17 +  5 = 22
 +    + =  +
20 +  5 = 25
------------
37 + 10 = 47
 */

 /*
 Napisz program w Prologu rozwi¹zuj¹cy nastêpuj¹ce zadanie:
  Wpisaæ liczby od 1 do 9 tak, aby sumy liczb
   wystêpuj¹cych w wierzcho³kach szeœciu poszczególnych kwadratów
    by³y równe. Czy rozwi¹zanie jest jednoznaczne?
 */

 /*
 A    B    C
 D    E    F
 G    H    I

  A    B
  D    E

  B    C
  E    F

  E    F
  H    I

  D    E
  G    H

  A    C
  G    I

  D    B
  F    H

 */

kwadrat3 :-
  X = [A,    B,    C,
       D,    E,    F,
       G,    H,    I],
  Digits = [1,2,3,4,5,6,7,8,9],
  assign(X, Digits),
  S is A + B + D + E,
  S =:= B + C + E + F,
  S =:= E + F + H + I,
  S =:= D + E + G + H,
  S =:= A + C + G + I,
  S =:= D + B + F + H,
  writeln(X),
  fail.
  
/*
1 ?- kwadrat3.
[1,6,7,8,5,2,3,4,9]
[1,8,3,6,5,4,7,2,9]
[3,4,9,8,5,2,1,6,7]
[3,8,1,4,5,6,9,2,7]
[7,2,9,6,5,4,1,8,3]
[7,6,1,2,5,8,9,4,3]
[9,2,7,4,5,6,3,8,1]
[9,4,3,2,5,8,7,6,1]
false.
*/

/*
 1    6    7
 8    5    2
 3    4    9
*/
