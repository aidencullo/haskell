filterLeft :: (a -> Bool) -> [a] -> [a]
filterLeft f = foldl (\acc x -> if f x then acc ++ [x] else acc) []

filter' :: (a -> Bool) -> [a] -> [a]
filter' f = foldr (\x acc -> if f x then x : acc else acc) []

filterAndReverse :: (a -> Bool) -> [a] -> [a]
filterAndReverse f = foldl (\acc x -> if f x then x : acc else acc) []

oneToTen :: [Int]
oneToTen = [1..10]

testFilterAndReverse :: Bool
testFilterAndReverse =
  let expected = reverse (filter even oneToTen)
  in filterAndReverse even oneToTen == expected

testFilterLeft :: Bool
testFilterLeft =
  let expected = filter even oneToTen
  in filterLeft even oneToTen == expected

testFilter :: Bool
testFilter =
  let expected = filter even oneToTen
  in filter' even oneToTen == expected
  
test :: Bool
test =
  testFilter &&
  testFilterLeft &&
  testFilterAndReverse
  