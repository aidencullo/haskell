head' :: [a] -> a
head' = foldr1 (\x _ -> x)

one :: Int
one = 1

oneToTen :: [Int]
oneToTen = [1..10]

testHead :: Bool
testHead = let expected = one
  in expected == head' oneToTen

test :: Bool
test = testHead
