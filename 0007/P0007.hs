{-# LANGUAGE UnicodeSyntax #-}

readInt ∷ IO Int
readInt = readLn

main ∷ IO ()
main = do
  t <- readInt
  countNthPrime t [3, 2]

countNthPrime ∷ Int → [Int] → IO ()
countNthPrime 0 _      = return ()
countNthPrime i primes = do
  n <- readInt
  let (p, primes') = prime n (head primes + 2) primes
  print p
  countNthPrime (i - 1) primes'

prime ∷ Int → Int -> [Int] → (Int, [Int])
prime n nextPrime primes
  | length primes >= n       = (primes!!(length primes - n), primes)
  | isPrime nextPrime primes = prime n (nextPrime + 2) (nextPrime : primes)
  | otherwise                = prime n (nextPrime + 2) primes

isPrime ∷ Int → [Int] → Bool 
isPrime n primes = isPrime' n (s n) (reverse primes)
  where
    s = floor . sqrt . fromIntegral
    isPrime' n s primes
      | null primes              = True
      | head primes > s          = True
      | n `mod` head primes == 0 = False
      | otherwise                = isPrime' n s (tail primes)
