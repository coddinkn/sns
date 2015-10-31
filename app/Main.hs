module Main where

import Data.Ratio
import qualified Data.Map.Strict as Map
import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game
import System.Random
import System.Directory

import World
import Input

render_world :: World -> Picture
render_world w = Blank

step_world :: Float -> World -> World
step_world _ w = w

main :: IO ()
main = do
    play (InWindow "Skeletons 'n Stuff" (1280, 1024) (10, 10))
      white
      10
      (World 0 [Floor [[0, 1], [1, 0]] [] []] (Player (0, 0) 10) images)
      render_world
      handle_input
      step_world
