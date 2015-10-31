module Generation where

import System.Random

floorWidth = 80
floorHeight = 64

genFloor :: StdGen -> [[Char]]
genFloor _ = take floorHeight (repeat (take floorWidth (repeat ' ')))
