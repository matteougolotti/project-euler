-- | Find the sum of even valued fibonacci numbers up to N

{-# LANGUAGE UnicodeSyntax #-}
import           Data.List

-- | Input: list of Ns separated by newline
-- | Output: list of sums of even Fibonacci numbers up to N separated by newline
main ∷ IO ()
main = interact $ \ s -> intercalate "\n"
                        $ show
                        . sumOfEvenFibonacci
                        . read
                        <$> (tail . lines) s

sumOfEvenFibonacci ∷ Int → Int
sumOfEvenFibonacci n = sum [ x | x <- takeWhile (<= n) fibs, x `mod` 2 == 0 ]

-- | Infinite list of lazy initialized Fibonacci numbers
fibs ∷ [Int]
fibs = fib 0 1
       where
       fib ∷ Int → Int → [Int]
       fib a b = a : fib b (a + b)
