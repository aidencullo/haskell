module Main where

import qualified Quicksort

main :: IO ()
main = do
  putStrLn "Quicksort tests:"
  putStrLn Quicksort.testReport
  putStrLn ("All passing: " ++ show Quicksort.allTests)

