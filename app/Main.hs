module Main where

import Data.Ratio
import qualified Data.Map.Strict as Map
import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game
import System.Directory

import World
import Input
import Render

step_world :: Float -> World -> World
step_world f w = w

main :: IO ()
main = do
    pwd <- getCurrentDirectory
    images <- load_tiles pwd
    play (InWindow "Skeletons 'n Stuff" (1280, 1024) (10, 10))
      white
      10
      (World 0 [] (Player (0, 0) 10) images)
      render_world
      handle_input
      step_world
