example :: [Int]
example = zipWith (\a b -> (3 * a) `div` b) [2..5] [1..4]
