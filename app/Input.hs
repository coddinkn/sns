module Input
(handle_input) where

import Graphics.Gloss.Interface.Pure.Game

import World

handle_input :: Event -> World -> World
handle_input k w = w 

key_press :: Event -> Char -> Bool
key_press (EventKey (Char c) Down _ _) k = k == c
key_press _ _ = False
