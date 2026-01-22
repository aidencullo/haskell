filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' f (x:xs)
  | f x = x : filter' f xs
  | otherwise = filter' f xs

fives :: [Int]
fives = replicate 5 5

main :: IO ()
main = test (filter' (>2) fives)

test :: [Int] -> IO ()
test [5,5,5,5,5] = print "correct"
test _ = print "incorrect"
