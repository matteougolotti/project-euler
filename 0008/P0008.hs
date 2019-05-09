{-# LANGUAGE UnicodeSyntax #-}
import           Data.List

main = interact $ intercalate "\n" . fmap (show . count) . adapt . tail . lines

adapt ∷ [String] → [(Int, [Int])]
adapt []            = []
adapt (nk:nums:ss)  = do
  let k = read $ words nk !! 1   :: Int
  let numbers = map ((\ s -> read s :: Int) . (:[])) nums
  (k, numbers) : adapt ss

count ∷ (Int, [Int]) → Int
count (k, numbers)
  | length numbers >= k = max (product (take k numbers)) (count (k, tail numbers))
  | otherwise           = 0
