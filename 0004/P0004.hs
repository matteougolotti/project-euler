import Data.List

main = interact $ intercalate "\n" . fmap (show . largestPalindrome . read) . tail . lines

isValidPalindrome :: String -> Bool
isValidPalindrome s = length s == 6 && s == reverse s

largestPalindrome :: Int -> Int
largestPalindrome n =
  let  palindromes = [ p | i <- [100..999],
                           j <- [i..999],
                           let p = i * j,
                           isValidPalindrome $ show p ]
  in maximum . filter (<n) $ palindromes