module Compare where

myCompare :: (Ord i) => i -> i -> Ordering
myCompare x y
  | x < y = LT
  | x > y = GT
  | otherwise = EQ
