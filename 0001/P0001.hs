{-# LANGUAGE UnicodeSyntax #-}
-- main ∷ IO ()
-- main = print (naturalSum 100)

import           Data.List

main ∷ IO()
main = interact $ intercalate "\n" . fmap (show . count . read) . tail . lines

naturalSum ∷ Int → Int
naturalSum n = n * (n + 1) `quot` 2

count ∷ Int → Int
count n = 3 * naturalSum(n' `quot` 3) + 5 * naturalSum(n' `quot` 5) - 15 * naturalSum(n' `quot` 15)
  where n' = n - 1
