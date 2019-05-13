{-# LANGUAGE UnicodeSyntax #-}

main = interact $ unlines . fmap (show . leastCommonMultiple . range . read) . tail . lines

range ∷ Int → [Int]
range n = [1..n]

leastCommonMultiple ∷ [Int] → Int
leastCommonMultiple = foldr lcm 1

