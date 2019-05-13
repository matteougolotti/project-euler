{-# LANGUAGE UnicodeSyntax #-}

main = interact $ unlines . fmap (show . count . read) . tail . lines
  where
    count ∷ Int → Int
    count n = (n * (n + 1) `quot` 2) ^ 2 - n * (n + 1) * (2 * n + 1) `quot` 6
