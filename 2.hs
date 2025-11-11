-- 2.1

{-
  *Main> 2^100
  1267650600228229401496703205376
  *Main> (12 + 23) * (40 - 21)
  665
  *Main> 2^100 / ((12 + 23) * (40 - 21))
  1.9062415041026007e27
  *Main> sqrt 2
  1.4142135623730951
  *Main> sqrt ((12 + 23) * (40 - 21))
  25.787593916455254
  *Main> 2+ -3
  
  <interactive>:8:1:
      Precedence parsing error
          cannot mix `+' [infixl 6] and prefix `-' [infixl 6] in the same infix
  pression
  *Main> 2+(-3)
  -1
-}

-- 2.2

{-
*Main> rem 1234 2
0
*Main> rem 1234 3
1
*Main> rem 1234 4
2
*Main> 1234 `rem` 3
1

*Main> :t pi
pi :: Floating a => a
*Main> pi
3.141592653589793
*Main> let f x = 2 * x + 1
*Main> f 5
11

*Main> let sphereVolume r = 4/3 * pi * r^3
*Main> sphereVolume 1
4.1887902047863905

*Main> let coneVolume r h = 1/3 * pi * r^2 * h
*Main> coneVolume 1 2
2.0943951023931953
-}


-- 2.6

module Math
where

f1 x = x - 2
f1' x = x + (-2)
f1'' = (+ (-2))

{-
*Math> f1 4
2
*Math> f1' 4
2
*Math> f1'' 4
2
-}

f2 x = rem x 5
f2' x = x `rem` 5
f2'' = (`rem` 5)

{-
*Math> f2 8
3
*Math> f2' 8
3
*Math> f2'' 8
3
-}

f3 x = x == 10
f3' = (== 10)

{-
*Math> f3 11
GT
*Math> f3' 9
LT
*Math> f3'' 10
EQ
-}

f4 x = div x 8
f4' x = x `div` 8
f4'' = (`div` 8)

{-
*Math> f4 10
1
*Math> f4' 10
1
*Math> f4'' 10
1
-}