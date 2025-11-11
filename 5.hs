module Integration where

{-
*Integration> :t (/)
(/) :: Fractional a => a -> a -> a
*Integration> (3 :: Float) / (5 :: Int)

<interactive>:23:17:
    Couldn't match expected type `Float' with actual type `Int'
    In the second argument of `(/)', namely `(5 :: Int)'
    In the expression: (3 :: Float) / (5 :: Int)
    In an equation for `it': it = (3 :: Float) / (5 :: Int)
*Integration> (3 :: Int) / (5 :: Float)

<interactive>:24:15:
    Couldn't match expected type `Int' with actual type `Float'
    In the second argument of `(/)', namely `(5 :: Float)'
    In the expression: (3 :: Int) / (5 :: Float)
    In an equation for `it': it = (3 :: Int) / (5 :: Float)
*Integration> :t fromIntegral
fromIntegral :: (Integral a, Num b) => a -> b
*Integration> (3 :: Float) / fromIntegral (5 :: Int)
0.6
*Integration> fromIntegral (3 :: Int) * (5 :: Float)
15.0
-}

rectangleRule :: (Float -> Float) -> Float -> Float -> Int -> Float
rectangleRule f a b n = h * sum (map f points)
  where
    h = (b - a) / fromIntegral(n)
    points = [a + fromIntegral(i) * h | i <- [1 .. n]]


integral1 = rectangleRule sin 0 pi 100   -- for 100 partitions
integral1' = rectangleRule sin 0 pi 1000  -- for 1000 partitions

{-
*Integration> integral1
1.9998356
*Integration> integral1'
1.9999988
-}

integral2 = rectangleRule sqrt 0 1 100
integral2' = rectangleRule sqrt 0 1 1000

{- 
*Integration> integral2
0.6714629
*Integration> integral2'
0.6671604
-}

integral3 = rectangleRule (^2) 0 1 100   -- with the use of section
integral3' = rectangleRule (^2) 0 1 1000  --

{-
*Integration> integral3
0.33835
*Integration> integral3'
0.33383355
-}

integral4 = rectangleRule (\x -> x^3 + 2*x) 0 2 100   -- with the use of lambda notation
integral4' = rectangleRule (\x -> x^3 + 2*x) 0 2 1000  --

{-
*Integration> integral4
8.120399
*Integration> integral4'
8.012006
-}

data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            | Null

bt_1 = Null
bt_2 = Leaf 5
bt_3 = Node 5 (Leaf 3) Null
bt_4 = Node 5 Null (Leaf 7)
bt_5 = Node 5 (Leaf 3) (Leaf 7)

-- 5.4.1

treeSize :: Tree a -> Int
treeSize Null = 0
treeSize (Leaf _) = 1
treeSize (Node _ left right) = 1 + treeSize left + treeSize right

{-
*Integration> treeSize bt_1
0
*Integration> treeSize bt_2
1
*Integration> treeSize bt_3
2
*Integration> treeSize bt_4
2
*Integration> treeSize bt_5
3
-}

showTree :: Show a => Tree a -> String
showTree Null = "()"
showTree (Leaf x) = show x
showTree (Node x left right) =
         show x ++ " L(" ++ showTree left ++ ") R(" ++ showTree right ++ ")"

bt1 = Node 7 (Node 4 (Leaf 2) (Leaf 5)) (Leaf 10)

bt2 = Node 7 (Node 4 (Leaf 2) (Leaf 5)) 
             (Node 10 (Leaf 9) (Node 13 (Leaf 11) (Leaf 15)))
 
bt3 = Node 7 (Leaf 1) Null

-- bt3 = Node 7 (Leaf 1) Null
-- showTree bt3
-- "7 L(1) R(())"

-- 5.5

{-
1. Adding value to an empty tree

              5
add 5 o   =   *

2. Adding value to a one-element tree

      5       5
add 5 *   =   *

      5       5
add 3 *   =   *
             / \
           3*   o

      5       5
add 7 *   =   *
             / \
            o   *7

3. Adding value to a non-trivial tree

      5       5
add 5 *   =   *
    _/ \_   _/ \_
   / \ / \ / \ / \

      5       5
add 3 *   =   *
    _/ \_   _/ \_
   / \ / \ /3\ / \

      5       5
add 7 *   =   *
    _/ \_   _/ \_
   / \ / \ / \ /7\
-}

add :: Ord a => a -> Tree a -> Tree a
add x Null = Leaf x
add x (Leaf y) | x == y = Leaf y
               | x < y = Node y (Leaf x) Null
               | x > y = Node y Null (Leaf x)

add x (Node y left right) | x == y = Node y left right
                          | x < y = Node y (add x left) right
                          | x > y = Node y left (add x right)


{-
       7
bt1   / \
     4   10
    / \
   2   5
      / \
     o   6
-}
{-
-}
{-
       7
bt1   / \
     4   10
    / \
   2   5
      / \
     o   8
-}
{-
*Integration> showTree(add 8 (add 6 bt1))
"7 L(4 L(2) R(5 L(()) R(6))) R(10 L(8) R(()))"
-}


tree2list :: Tree
tree2list Null = []
tree2list (Leaf x) = [x]
tree2list (Node x left right) = []
