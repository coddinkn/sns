module World where

import Data.Map.Strict
import Graphics.Gloss

type Position = (Int, Int)
type Tile = Int

data Item = Money { moneyPosition :: Position, moneyAmount :: Int }
          | Food { foodPosition :: Position, foodAmount :: Int }
          | BoneSaw { bonePosition :: Position, sawAmount :: Int }

data Monster = Monster { monsterPosition :: Position
                       , monsterID :: Int
                       , monsterHealth :: Int
                       , monsterVariety :: Char
                       , inventory :: [Item]
                       }

data Floor = Floor { terrainLayer :: [[Tile]]
                   , itemLayer :: [Item]
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
