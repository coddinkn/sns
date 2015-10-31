module Main where

import Data.Ratio
import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game

import World
import Input

render_world :: World -> Picture
render_world w | not $ null $ floors w = Color cyan (Circle 3.14) 
    | otherwise = Blank

step_world :: Float -> World -> World
step_world f w = w

main :: IO ()
main = play (InWindow "Skeletons 'n Stuff" (1280, 1024) (10, 10)) white 10 (World [] (Player (0, 0) 10)) render_world handle_input step_world
