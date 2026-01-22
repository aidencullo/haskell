-- Just to show you how powerful folds are, we're going to implement a bunch of standard library functions by using folds:

maximum' :: (Ord a) => [a] -> a
maximum' xs = foldl1 max xs
