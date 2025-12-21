quickSort :: [a] -> [a]
-- quickSort (x:xs) =
--   let left = filter xs (<x)
-- f x =
--   let y = x + 1
--       z = y * 2
--   in z
  
oneToTen = [1..10]
tenToOne = reverse oneToTen

testQuickSort :: Bool
testQuickSort = quickSort tenToOne == oneToTen
