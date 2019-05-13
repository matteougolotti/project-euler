{-# LANGUAGE UnicodeSyntax #-}

main = interact $ unlines . fmap (show . largestPrimeFactorial . read) . tail . lines

largestPrimeFactorial ∷ Int → Int
largestPrimeFactorial = maximum . primes
  where
    primes ∷ Int → [Int]
    primes = nextPrime 2
    nextPrime ∷ Int → Int → [Int]
    nextPrime i n
      | i > round(sqrt(fromIntegral n)) + 1 = [n | n > 2]
      | n `mod` i == 0  = i : nextPrime i (n `quot` i)
      | otherwise       = nextPrime (i + 1) n
