module Main where

import Data.Ratio
import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game
import System.Random

import World
import Input
import Generation

render_world :: World -> Picture
render_world w | not $ null $ floors w = Color cyan (Circle 3.14) 
    | otherwise = Blank

step_world :: Float -> World -> World
step_world f w = w

main :: IO ()
main = do
    gen <- getStdGen
    let floorOne = genFloor gen in
        play (InWindow "Skeletons 'n Stuff" (1280, 1024) (10, 10)) white 10 (World [(Floor floorOne [] [])] (Player (0, 0) 10)) render_world handle_input step_world
