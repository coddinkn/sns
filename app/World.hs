module World where

import Data.Map.Strict
import Graphics.Gloss

type Position = (Int, Int)
type Tile = Int

data Item = Money {moneyPosition :: Position, moneyAmount :: Int}
    | Food {foodPosition :: Position, foodAmount :: Int}
    | BoneSaw {bonePosition :: Position, sawAmount :: Int}

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
    terrainLayer :: [[Tile]],
    itemLayer :: [Item],
    monsterLayer :: [Monster]
}

data World = World {
    curFloor :: Int,
    floors :: [Floor],
    player :: Player,
    tiles :: Map Tile Picture
}
