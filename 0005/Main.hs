{-# LANGUAGE UnicodeSyntax #-}
-- | https://www.hackerrank.com/contests/projecteuler/challenges/euler005

import qualified Data.Map.Strict as M

primes ∷ Int → [Int]
primes n = findPrimes 2 n [] []
  where
  findPrimes ∷ Int → Int → [Int] → [Int] → [Int]
  findPrimes p m primes nonprimes
    | p > m              = primes
    | p `elem` nonprimes = findPrimes (p + 1) m primes nonprimes
    | otherwise          = findPrimes (p + 1) m (p : primes) (nonprimes ++ [p, p + p..m])

primeNumbers = primes 40

initPrimeFactors ∷ [Int] → M.Map Int Int → M.Map Int Int
initPrimeFactors (p:primes) factors = foldl (\ factors p -> M.insert p 0 factors) factors primes

primeFactors = initPrimeFactors primeNumbers M.empty

primeFactorisation ∷ Int → M.Map Int Int
primeFactorisation n = factorize n primeNumbers primeFactors
  where
    factorize ∷ Int → [Int] → M.Map Int Int → M.Map Int Int
    factorize n (p:ps) factors = if n `mod` p == 0
                                 then factorize (n `quot` p) (p:ps) (M.insert p (occurrences + 1) factors)
                                 else factorize n ps factors
    factorize n [] factors     = factors

count ∷ Int → Int
count n = do
  let factors = fmap primeFactorization [0..n]


main ∷ IO ()
main = interact (show . fmap (count . read) . tail . lines)
