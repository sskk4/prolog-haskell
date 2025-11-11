module Solids
where

sphereVolume :: Floating a => a -> a  -- obliczenie objetosci kuli
sphereVolume r = 4/3 * pi * r^3

coneVolume :: Floating a => a -> a -> a  -- obliczenie objetosci stozka
coneVolume r h = 1/3 * pi * r^2 * h

{-
*Main> :l solids
[1 of 1] Compiling Solids           ( solids.hs, interpreted )
Ok, modules loaded: Solids.
*Solids> coneVolume 1 1
1.0471975511965976
*Solids> sphereVolume 2
33.510321638291124
-}