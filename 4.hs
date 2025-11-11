module Lists where

import Data.Char

{-
*Lists> map (^2) [1,3,5]
[1,9,25]
*Lists> map (\x -> x*x) [1,3,5]
[1,9,25]
*Lists> let f = (^2) in map f [1,3,5]
[1,9,25]
*Lists> sum [1,3,5]
9
*Lists> sqrt (sum [1,3,5])
3.0
-}

sumOfSquares' x = sum (map (^2) x)

{-
*Lists> sumOfSquares' [1,3,5]
35
-}

{-
*Lists> :t (:)
(:) :: a -> [a] -> [a]
*Lists> 3:[]
[3]
*Lists> 3:5:[]
[3,5]
*Lists> 3:[5]
[3,5]
*Lists> let f(x:xs) = (x,xs)
*Lists> f[3,5,7]
(3,[5,7])
-}

sumOfSquares [] = 0
sumOfSquares (x:xs) = x^2 + sumOfSquares xs

-- 4.2

{-
Prelude> let f0 (x:xs) = x
Prelude> let f1 (_:x:xs) = x
Prelude> let f2 (_:_:x:xs) = x
Prelude> f0 [3,5,7]
3
Prelude> f1 [3,5,7]
5
Prelude> f2 [3,5,7]
7
Prelude> f0 []
*** Exception: <interactive>:3:5-17: Non-exhaustive patterns in function f0
-}


-- 4.2.1

sum1 [] = 0
sum1 [_] = 0
sum1 (_:x:xs) = x + sum1 xs

{-
[1,2,3,4] -> [3,4] -> []

[1,2,3] -> [3]

*Lists> sum1 [1,2,3,4]
6
*Lists> sum1 [1,2,3]
2
-}

-- 4.3

{-
*Lists> :t "cat"
"cat" :: [Char]
*Lists> ['c','a','t']
"cat"
*Lists> 3 : [5,7]
[3,5,7]
*Lists> [3,5] ++ [7]
[3,5,7]
*Lists> 'c' : "at"
"cat"
*Lists> "c" ++ "at"
"cat"
*Lists> let small x = 'a' <= x && x <= 'x'
*Lists> small 'c'
True
*Lists> small 'X'
False
-}

countLower :: [Char] -> Integer
countLower [] = 0
countLower (x:xs) | 'a' <= x && x <= 'z' =  1 + countLower xs
                  | otherwise = countLower xs

{-
 *Lists> countLower "abc"
3
*Lists> countLower "abcDEF"
3
*Lists> countLower "abcDEFag"
5
-}

-- 4.5.1

cgtx x [] = 0
cgtx x (y:ys) | x < y = 1 + cgtx x ys
              | otherwise = cgtx x ys

{-
*Lists> cgtx 3 [1,2,3,4,5]
2
*Lists> cgtx 3 []
0
*Lists> cgtx 3 [5]
1
*Lists> cgtx 3 [2]
0
-}

gtx _ [] = []
gtx x (y:ys) | x < y = y : gtx x ys
             | otherwise = gtx x ys

{-
*Lists> gtx 3 [1,2,3,4,5]
[4,5]
*Lists> gtx 2 [1,2,3,4,5]
[3,4,5]
*Lists> gtx 2 []
[]
-}

-- 4.6

{-

*Lists> :t read
read :: Read a => String -> a
*Lists> :t show
show :: Show a => a -> String
*Lists> read "35"
*** Exception: Prelude.read: no parse
*Lists> read "35" :: Int
35
*Lists> show 35
"35"

-}


string2int x = read x :: Int

{-
*Lists> string2int "35"
35
-}

string2int' :: String -> Int
string2int' x = read x

{-
*Lists> string2int' "35"
35
-}

-- 4.7

{-
*Lists> :t sum
sum :: (Num a, Foldable t) => t a -> a
*Lists> :t product
product :: (Num a, Foldable t) => t a -> a
*Lists> sum [1,3,5]
9
*Lists> product [1,3,5]
15
*Lists> [1..5]
[1,2,3,4,5]
*Lists> [n | n <- [1..5]]
[1,2,3,4,5]
-}

-- 4.7.1

suma1 = sum (map (1.0/) [1..100])
suma1' = sum (map (\x -> 1/x) [1..100])
suma1'' = sum [1/x | x <- [1..100]]

{-
*Lists> suma1
5.187377517639621
*Lists> suma1'
5.187377517639621
*Lists> suma1''
5.187377517639621
-}

-- 4.7.2

iloczyn1 = product (map (\x -> (1+x)/(2+x)) [1..50])
iloczyn1' = product [(1+x)/(2+x) | x <- [1..50]]
iloczyn1'' = foldl (*) 1 [(1+x)/(2+x) | x <- [1..50]]

{-
*Lists> iloczyn1
3.846153846153846e-2
*Lists> iloczyn1'
3.846153846153846e-2
*Lists> iloczyn1''
3.846153846153846e-2
-}

-- 4.8

factors :: Integer -> [Integer]
factors n = [x | x <- [1..n], n `mod` x == 0]

prime :: Integer -> Bool
prime n = factors n == [1,n]

primes :: [Integer]
primes = filter prime [2 ..]

{-
*Lists> factors 12
[1,2,3,4,6,12]
*Lists> prime 11
True
*Lists> prime 12
False
*Lists> take 10 primes
[2,3,5,7,11,13,17,19,23,29]
-}