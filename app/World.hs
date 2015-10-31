module World where

import Data.Map.Strict
import Graphics.Gloss

type Position = (Int, Int)
type Tile = Int

data Monster = Monster { monsterPosition :: Position
                       , monsterID :: Int
                       , monsterHealth :: Int
                       , monsterVariety :: Tile
                       , inventory :: [Monster]
                       , isItem :: Bool
                       }

data Floor = Floor { terrainLayer :: [[Tile]]
                   , monsterLayer :: [Monster]
                   }

floorWidth = 80
floorHeight = 63

emptyTerrain = take floorHeight $ repeat $ take floorWidth $ repeat ((-1) :: Tile)

data World = World { curFloor :: Int
                   , floors :: [Floor]
                   , tiles :: Map Tile Picture
                   , curMessage :: String
                   }
