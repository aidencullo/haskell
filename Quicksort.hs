quickSort :: Ord a => [a] -> [a]
quickSort (x:xs) =
  let left = filter (<=x) xs
      right = filter (>x) xs
  in quickSort(left) ++ [x] ++ quickSort(right)
quickSort [] = []
-- f x =
--   let y = x + 1
--       z = y * 2
--   in z
  
oneToTen = [1..10]
tenToOne = reverse oneToTen

testQuickSort :: Bool
testQuickSort = quickSort tenToOne == oneToTen
