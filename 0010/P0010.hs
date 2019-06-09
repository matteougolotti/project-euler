{-# LANGUAGE UnicodeSyntax #-}

readInt ∷ IO Int
readInt = readLn

main ∷ IO ()
main = do
  t <- readInt
  countNthPrime t [3, 2] [2, 3]

countNthPrime ∷ Int → [Int] → [Int] → IO ()
countNthPrime 0 _ _     = return ()
countNthPrime i primes revprimes = do
  n <- readInt
  let (primes', revprimes') = prime n (head primes + 2) primes revprimes
  print $ sum $ filter (<=n) primes'
  countNthPrime (i - 1) primes' revprimes'

prime ∷ Int → Int → [Int] → [Int] → ([Int], [Int])
prime n nextPrime primes revprimes
  | head primes >= n                   = (primes, revprimes)
  | isPrime nextPrime primes revprimes = prime n (nextPrime + 2) (nextPrime : primes) (revprimes ++ [nextPrime])
  | otherwise                          = prime n (nextPrime + 2) primes revprimes

isPrime ∷ Int → [Int] → [Int] → Bool
isPrime n primes revprimes = isPrime' n (s n) revprimes
  where
    s = floor . sqrt . fromIntegral
    isPrime' n s primes
      | null primes              = True
      | head primes > s          = True
      | n `mod` head primes == 0 = False
      | otherwise                = isPrime' n s (tail primes)
