{-# LANGUAGE UnicodeSyntax #-}

import           Control.Monad
import           Data.Map
import qualified Data.Map      as Map
import           Data.Maybe

main = interact $ show . maxProduct . toMap . Prelude.map (Prelude.map read . words) . lines

toMap ∷ [[Int]] → Map.Map (Int, Int) Int
toMap table =
  let indexedTable = [  ((row, col), item) | (row, line) <- zip [0..] table, (col, item) <- zip [0..] line ]
  in Data.Map.fromList indexedTable

maxProduct ∷ Map.Map (Int, Int) Int → Int
maxProduct table =
  let right      = [(0, 0), (0, 1), (0, 2), (0, 3)]
      right_down = [(0, 0), (1, 1), (2, 2), (3, 3)]
      right_up   = [(0, 0), (-1, 1), (-2, 2), (-3, 3)]
      down       = [(0, 0), (1, 0), (2, 0), (3, 0)]
  in
    maximum $ Control.Monad.join [
      [
        product [ fromMaybe 1 (Map.lookup (row + x, col + y) table) | (x, y) <- right],
        product [ fromMaybe 1 (Map.lookup (row + x, col + y) table) | (x, y) <- right_down ],
        product [ fromMaybe 1 (Map.lookup (row + x, col + y) table) | (x, y) <- right_up ],
        product [ fromMaybe 1 (Map.lookup (row + x, col + y) table) | (x, y) <- down ]
      ]
      | row <- [0..19], col <- [0..19]
    ]
