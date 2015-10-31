module Main where

import Data.Ratio
import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game

type Position = (Int, Int)

data Item = Money {moneyPosition :: Position, moneyAmount :: Int}
    | Food {foodPosition :: Position, foodAmount :: Int} 

data Monster = Monster {
    monsterPosition :: Position,
    monsterID :: Int,
    monsterHealth :: Int,
    monsterVariety :: Char
}

data Player = Player {
    playerPosition :: Position,
    playerHealth :: Int
}

data Floor = Floor {
    terrainLayer :: [[Char]],
    itemLayer :: [Item],
    monsterLayer :: [Monster]
}

data World = World {
    floors :: [Floor],
    player :: Player
}

to_pos :: Integer -> Float
to_pos a = fromRational ((10 * a) % 800)

render_world :: World -> Picture
render_world w | not $ null $ floors w = Color cyan (Circle 3.14) 
    | otherwise = Blank

handle_input :: Event -> World -> World
handle_input e w = w

step_world :: Float -> World -> World
step_world f w = w

main :: IO ()
main = play (InWindow "Skeletons 'n Stuff" (1280, 1024) (10, 10)) white 10 (World [] (Player (0, 0) 10)) render_world handle_input step_world
