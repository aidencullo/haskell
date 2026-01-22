last' :: [a] -> a
last' = foldl1 (\_ x -> x)

ten :: Int
  ten = 10

oneToTen :: [Int]
oneToTen = [1..10]

testLast :: Bool
testLast = let expected = ten
  in expected == last' oneToTen

test :: Bool
test = testLast
