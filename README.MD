📁 Haskell - Programowanie Funkcyjne
Pliki podstawowe (1-4.hs)

1.hs - Podstawy: funkcje, arytmetyka (f x = 2*x + 1)
2.hs - Operatory, sekcje, funkcje matematyczne (sphereVolume, coneVolume)
3.hs - Guards, rekurencja (factorial), operatory własne (><)
4.hs - Listy, map, filter, list comprehensions, liczby pierwsze

Zaawansowane (5-6.hs)

5.hs (Integration.hs) - Całkowanie numeryczne (metoda prostokątów), drzewa binarne BST
6.6.1.hs - Analiza PESEL: zliczanie kobiet (parzysta cyfra na 10. pozycji)
6.6.3.hs - Rozkład dekad urodzenia z PESEL (1901-2000)
silnia.hs - IO: interakcja z użytkownikiem, obliczanie silni
solids.hs - Moduł geometryczny (objętości kuli i stożka)

Uruchomienie
bashghci plik.hs                    # Interpreter
ghc plik.hs -o program          # Kompilacja
./program arg1 arg2             # Uruchomienie
```

### Kluczowe koncepcty
- **Pattern matching**: `f [] = 0; f (x:xs) = x + f xs`
- **Rekurencja** zamiast pętli
- **Lazy evaluation** - ewaluacja na żądanie
- **Typy**: `Int`, `Float`, `[a]`, `Tree a`
- **Klasy**: `Eq`, `Num`, `Fractional`, `Floating`
- **IO monad**: `getLine`, `putStrLn`, `readFile`

---

## 📁 Prolog - Programowanie Logiczne

### 7.2.pro / rodzina.pro - Baza wiedzy
**Drzewo genealogiczne:**
```
Ola + Tomek → Max, Lila
Max → Ania, Kasia
Kasia → Radek
Predykaty:

rodzic(X,Y), kobieta(X), mezczyzna(X)
matka(X,Y), ojciec(X,Y), siostra(X,Y), para(X,Y)
potomek(X,Y) - rekurencyjnie po drzewie

Geografia - miasta i zabytki:

6 krajów, 9 miast, 20 zabytków
polozenie(Miasto, Panstwo), gdzie(Zabytek, Miasto)
sasiad(P1, P2) - kraje graniczące

8.pro - Operacje i równania

zabytki_m(Miasto) - wypisuje zabytki
trojmian(A,B,C,X) - rozwiązuje ax² + bx + c = 0 (Δ, pierwiastki)
Operator cięcia ! - zatrzymuje backtracking

9.pro - Listy

take(N, Lista, Wynik) - N pierwszych elementów
init(Lista, Wynik) - bez ostatniego
middle(Lista, Wynik) - bez pierwszego i ostatniego
permutation(P, L) - generuje permutacje
listSum, listProd - suma/iloczyn elementów

10.pro - Zagadki logiczne (CSP)

Szyfr do sejfu - 9 cyfr z warunkami
Magiczny kwadrat 4×4 - sumy = 34
Kryptarytmetyka - AB + C = DD (A=1, B=7, C=5, D=2, E=0, F=3, G=4)
Kwadrat 3×3 - równe sumy w 6 kwadratach 2×2
assign(Zmienne, Cyfry) - przypisanie unikalnych wartości

12.pro - Napisy

count(Lista, Znak, N) - zlicza wystąpienia
countChars(Napis, N, Znak) - zlicza znak w napisie

Uruchomienie
prologswipl plik.pro
?- [plik].                      % Załaduj
?- rodzic(R, max).              % Zapytanie
R = ola ;                       % Wynik 1
R = tomek.                      % Wynik 2
Kluczowe koncepty

Fakty: rodzic(ola,max).
Reguły: matka(X,Y) :- rodzic(X,Y), kobieta(X).
Operatory: , (AND), ; (OR), ! (cięcie)
Zmienne: X, Y (wielkie litery), _ (anonimowa)
Backtracking - automatyczne przeszukiwanie
Rekurencja: potomek(X,Y) :- rodzic(Y,X). potomek(X,Y) :- rodzic(Y,Z), potomek(X,Z).


🎯 Porównanie
AspektHaskellPrologParadygmatFunkcyjnyLogiczny/DeklaratywnyObliczeniaEwaluacja wyrażeńDowodzenie twierdzeńZmienneNiezmienneUnifikacjaKontrolaRekurencja, pattern matchingBacktracking, regułyTypowanieStatyczne, silneDynamiczne

Tematy: funkcje wyższego rzędu • rekurencja • pattern matching • lazy evaluation • drzewa BST • IO • przetwarzanie plików • CSP • backtracking • unifikacja