quickSort :: [a] -> [a]
quickSortHelper xs [] = xs
quickSortHelper [] xs = xs

oneToTen = [1..10]

testQuickSort :: Bool
testQuickSort = quickSort oneToTen == oneToTen
