module Math
where

-- 3.1

{-
*Main> not True
False
*Main> True && False
False
*Main> True || False
True
*Main> let f1 x | x == 0 = "zero"
*Main> f1 0
"zero"
*Main> f1 1
"*** Exception: <interactive>:5:5-26: Non-exhaustive patterns in function f1

*Main> let f2 x = if x == 0 then "zero" else undefined
*Main> f2 0
"zero"
*Main> f2 1
"*** Exception: Prelude.undefined
*Main> :t otherwise
otherwise :: Bool
*Main> otherwise
True
-}

f x | x < -10 = x*x
    | -10 <= x && x < 0 = sin x
    | 0 <= x && x <= 2 = sqrt x

{-
*Math> f (-12)
144.0
*Math> f (-pi)
-1.2246063538223773e-16
*Math> f 1
1.0
*Math> f 5
*** Exception: lab3.hs:(30,1)-(32,31): Non-exhaustive patterns in function f
-}

f' x | x < -10 = x*x
     | -10 <= x && x < 0 = sin x
     | 0 <= x && x <= 2 = sqrt x
     | otherwise = undefined
     
{-
*Math> f' (-12)
144.0
*Math> f' (-pi)
-1.2246063538223773e-16
*Math> f' 1
1.0
*Math> f' 5
*** Exception: Prelude.undefined
-}

-- 3.2

{-
*Math> :t div
div :: Integral a => a -> a -> a
*Math> :t (/)
(/) :: Fractional a => a -> a -> a
*Math> 6 `div` 4
1
*Math> 6/4
1.5
*Math> (6 :: Int) `div` (4 :: Int)
1
*Math> (6 :: Int) / (4 :: Int)

<interactive>:10:12:
    No instance for (Fractional Int) arising from a use of `/'
    In the expression: (6 :: Int) / (4 :: Int)
    In an equation for `it': it = (6 :: Int) / (4 :: Int)
-}

factorial :: Integer -> Integer
factorial n | n == 1 = 1
            | n > 1 = n * factorial(n-1)

binomialCoefficient k n | 0 <= k && k <= n = factorial n `div` (factorial n * factorial(n - k))

{-
*Math> factorial 3
6
*Math> binomialCoefficient 3 5
10

-}

-- 3.4

{-
*Math> :t rem
rem :: Integral a => a -> a -> a
*Math> rem 3 4
3
*Math> rem 4 3
1
-}

divides :: Int -> Int -> Bool
divides k n = n `rem` k == 0 

-- 3.5 

seq' 1 = 3
seq' 2 = 4
seq' n = 0.5 * seq' (n - 1) + 2 * seq' (n - 2)

{-
*Math> seq' 1
3.0
*Math> seq' 2
4.0
*Math> seq' 5
22.0
-}

-- 3.7

{-
Prelude> 3*5
15
Prelude> (*) 3 5
15
Prelude> :t gcd
gcd :: Integral a => a -> a -> a

typ funkcji gcd
typ jest a gdzie a nale¿y do klas typu integral
-}

 -- 3.7
 
 {-
*Math> 3 * 5    -- operator
15
*Math> (*) 3 5  -- function
15
*Math> :t gcd
gcd :: Integral a => a -> a -> a
*Math> gcd 12 6
6
 -}

(><) :: Integral a => a -> a -> Bool
x >< y = x `gcd` y == 1

 {-
*Math> :t (><)
(><) :: Integral a => a -> a -> Bool
*Math> 12 >< 6
False
*Math> 15 >< 8
True
 -}
 
 -- 3.8
 
 {-
 z1 = (a, b) = a + b*i    i*i = - 1
 z2 = (c, d) = c + d*i

 z1 * z2 =  (a + b*i) * (c + d*i) = a*c + a*d*i + b*c*i - b*d =
         = a*c - b*d + (a*d + b*c)*i = (a *c - b*d, a*d + b*c)
 -}
 
 
