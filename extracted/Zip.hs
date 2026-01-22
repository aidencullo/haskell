zip' :: [a] -> [b] -> [(a, b)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x, y):zip' xs ys

-- zip [1,2,3] ['a','b'] -- [(1,'a'), (2,'b')]
