{-# LANGUAGE UnicodeSyntax #-}
import           Data.List

main ∷ IO ()
main = interact $ \ s -> intercalate "\n" $ show . sumOfEvenFibonacci . read <$> (tail . lines) s

sumOfEvenFibonacci ∷ Int → Int
sumOfEvenFibonacci n = sum [ x | x <- takeWhile (<= n) fibs, x `mod` 2 == 0 ]

fibs ∷ [Int]
fibs = fib 0 1
       where
       fib ∷ Int → Int → [Int]
       fib a b = a : fib b (a + b)
