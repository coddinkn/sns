module World where

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
