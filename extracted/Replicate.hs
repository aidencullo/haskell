module Replicate where

replicate' :: (Num a, Ord a) => a -> b -> [b]
replicate' n x
  | n < 0 = error "cannot replicate something negative times"
  | n == 0 = []
  | otherwise = x:replicate' (n - 1) x
