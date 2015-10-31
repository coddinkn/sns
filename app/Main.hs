module Main where

import Data.Ratio
import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game

-- the world is a list of character and where they be
type World = [(Char, (Integer, Integer))]

to_pos :: Integer -> Float
to_pos a = fromRational ((10 * a) % 800)
render_world :: World -> Picture
render_world [] = Blank
render_world ((c, (x, y)) : xs) = Pictures ([Translate (to_pos x) (to_pos y) (Text [c]), render_world xs])

handle_input :: Event -> World -> World
handle_input e w = w

step_world :: Float -> World -> World
step_world f w = w

main :: IO ()
main = play (InWindow "Skeletons 'n Stuff" (800, 800) (10, 10)) white 10  [('a', (0, 0)), ('b', (3, 3)), ('@', (57, 23))] render_world handle_input step_world
