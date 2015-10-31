module Generation where

import System.Random

import World

genFloor :: StdGen -> IO Floor
genFloor gen = do 
    terrain <- genTerrain gen emptyTerrain
    items <- genItems gen terrain
    monsters <- genMonsters gen terrain
    return $ Floor terrain items monsters

genTerrain :: StdGen -> [[Tile]] -> IO [[Tile]]
genTerrain _ _ = do
    width <- randomR (4, floorWidth - )
    height <-

    return emptyTerrain

genItems :: StdGen -> [[Tile]] -> IO [Item]
genItems _ _ = do
    return []

genMonsters :: StdGen -> [[Tile]] -> IO [Monster]
genMonsters _ _ = do
    return []
