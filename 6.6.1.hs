module Main where

import System.Environment

-- 6.6.1

{-
*Main> :t elem
elem :: (Eq a, Foldable t) => a -> t a -> Bool
*Main> elem 1 [1,3,5]
True
*Main> elem 2 [1,3,5]
False
*Main> let f [a,b,_] = (a, b)
*Main> f "cat"
('c','a')
*Main> f "zonk"
*** Exception: <interactive>:5:5-22: Non-exhaustive patterns in function f

*Main> lines "It is the first line.\nIt is the second line."
["It is the first line.","It is the second line."]
-}

womenCount :: [[Char]] -> Int
womenCount [] = 0
womenCount [_, _, _, _, _, _, _, _, _, p, _]
    | elem p "02468" = 1 + womenCount xs
    | otherwise = womenCount xs   

pesels = ["", ""]

main = do
  [f] <- getArgs
  tekst <- readFile f
  let women = womenCount (lines tekst)
  putStrLn ("number of women: " ++ show women)