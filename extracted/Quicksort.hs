module Quicksort where

import Data.List (sort)

quickSort :: Ord a => [a] -> [a]
quickSort (x : xs) =
  let left = filter (<= x) xs
      right = filter (> x) xs
   in quickSort left ++ [x] ++ quickSort right
quickSort [] = []

isSorted :: Ord a => [a] -> Bool
isSorted [] = True
isSorted [_] = True
isSorted (a : b : xs) = a <= b && isSorted (b : xs)

oneToTen :: [Int]
oneToTen = [1 .. 10]

tenToOne :: [Int]
tenToOne = reverse oneToTen

-- Keep the original test name, but add many more.
testQuickSort :: Bool
testQuickSort = quickSort tenToOne == oneToTen

tests :: [(String, Bool)]
tests =
  [ ("reverse 1..10 -> 1..10", testQuickSort)
  , ("empty list", quickSort ([] :: [Int]) == [])
  , ("singleton", quickSort [42 :: Int] == [42])
  , ("already sorted stays sorted", quickSort oneToTen == oneToTen)
  , ("duplicates preserved + sorted", quickSort [3, 1, 2, 3, 2, 1 :: Int] == [1, 1, 2, 2, 3, 3])
  , ("negatives sorted", quickSort [0, -1, 5, -10, 3 :: Int] == [-10, -1, 0, 3, 5])
  , ("strings sorted", quickSort ["banana", "apple", "cherry", "apple"] == ["apple", "apple", "banana", "cherry"])
  , ("output is sorted (sample)", isSorted (quickSort [5, 1, 4, 2, 8, 5, 0 :: Int]))
  , ("idempotent (sample)", quickSort (quickSort [5, 1, 4, 2, 8, 5, 0 :: Int]) == quickSort [5, 1, 4, 2, 8, 5, 0])
  , ("matches Data.List.sort (sample)", quickSort ([5, 1, 4, 2, 8, 5, 0, -3, 9 :: Int]) == sort [5, 1, 4, 2, 8, 5, 0, -3, 9])
  ]

allTests :: Bool
allTests = and (map snd tests)

testReport :: String
testReport =
  unlines $
    map
      ( \(name, ok) ->
          (if ok then "PASS " else "FAIL ") ++ name
      )
      tests
