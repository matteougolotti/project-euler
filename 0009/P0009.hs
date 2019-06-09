{-# LANGUAGE UnicodeSyntax #-}

(|>) x f = f x

main :: IO ()
main = interact $ unlines . fmap (show . count . read) . tail . lines

count ∷ Int → Int
count n = [1..n `quot` 3]
  |> map (\ a -> do
      let c = (-2 * a ^ 2 + ((a * n) * 2) - n ^ 2) `quot` ((a - n) * 2)
      let b = (floor . sqrt . fromIntegral) (c ^ 2 - a ^ 2)
      (a, b, c))
  |> filter (\ (a, b, c) -> a + b + c == n && a ^ 2 + b ^ 2 == c ^ 2)
  |> map (\ (a, b, c) -> a * b * c)
  |> (-1:)
  |> maximum
