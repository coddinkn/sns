module Input
(handle_input) where

import Graphics.Gloss.Interface.Pure.Game

import World

handle_input :: Event -> World -> World
handle_input k w | key_press k 'h' = movePlayer DirLeft w
                 | key_press k 'j' = movePlayer DirDown w
                 | key_press k 'k' = movePlayer DirUp w
                 | key_press k 'j' = movePlayer DirRight w
                 | otherwise = w

data Dir = DirLeft | DirRight | DirUp | DirDown deriving Eq

movePlayer :: Dir -> World -> World
movePlayer d (World c f (Player (x, y) h) t)
                   | d == DirLeft  = World c f (Player (x - 1, y) h) t
                   | d == DirDown  = World c f (Player (x, y + 1) h) t
                   | d == DirUp    = World c f (Player (x, y - 1) h) t
                   | d == DirRight = World c f (Player (x + 1, y) h) t
                   | otherwise = error "not a direction"

key_press :: Event -> Char -> Bool
key_press (EventKey (Char c) Down _ _) k = k == c
key_press _ _ = False
