module Render (render_world, load_tiles) where

import World
import qualified Data.Map.Strict as Map
import Graphics.Gloss
import Data.Maybe
import Data.Ratio

load_tiles :: FilePath -> IO (Map.Map Tile Picture)
load_tiles p =
    ((sequenceA . map sequenceA)
        (fmap (\x -> (fst x, loadBMP (toFileName x)))
        [(0, "$"), (1, "at"), (2, "b"),
         (3, "hero"), (4, "ll+"), (5, "lr+"),
         (6, "minus"), (7, "pipe"), (8, "plus"),
         (9, "skele"), (10, "ul+"), (11, "ur+")])) >>= (\x -> return (Map.fromList x))
  where
  toFileName (_, b) = p ++ "/assets/" ++ b ++ ".bmp"

render_world :: World -> Picture
render_world w = Pictures [
    if (curFloor w) >= length (floors w) then Blank else render_floor ((floors w) !! (curFloor w)) (tiles w),
    Color white $ Translate (-640) (-512) $ Scale 0.15 0.15 $  Text (curMessage w)
    ]

obn :: [a] -> (Int -> a -> b) -> [b]
obn l f = obn' l f 0
  where
  obn' [] _ _ = []
  obn' (x:xs) f n = [f n x] ++ obn' xs f (n + 1)

obn2 :: [[a]] -> (Int -> Int -> a -> b) -> [b]
obn2 l f = obn2' l f 0
  where
  obn2' [] _ _ = []
  obn2' (x:xs) f n = (obn x (\m -> (\x -> f n m x))) ++ (obn2' xs f (n + 1))

grid_to_x :: Int -> Float
grid_to_x x = (16 * ((fromIntegral x) - ((fromIntegral floorWidth) - 1)/2))
grid_to_y :: Int -> Float
grid_to_y y = (16 * ((fromIntegral y) - ((fromIntegral floorHeight) - 1)/2)) + 8

render_floor :: Floor -> (Map.Map Tile Picture) -> Picture
render_floor f tm = Pictures $ obn2 (terrainLayer f) (\m -> \n -> \x -> maybe Blank (\t -> Translate (grid_to_x n) (grid_to_y m) t) (Map.lookup x tm))
