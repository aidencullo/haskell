module Main where

-- Import all other Haskell files
import qualified ApplyTwice
import qualified Compare
import qualified CompareWithHundred  
import qualified DivideByTen
import qualified IsUpperCase
import qualified Maximum
import qualified MultThree
import qualified MultTwoWithNine
import qualified Replicate
import qualified Sign
import qualified Take

main :: IO ()
main = do
    putStrLn "All modules imported successfully!"
    putStrLn "Available functions:"
    putStrLn "- applyTwice"
    putStrLn "- compareWithHundred"
    putStrLn "- divideByTen" 
    putStrLn "- isUpperCase"
    putStrLn "- maximum'"
    putStrLn "- multThree"
    putStrLn "- multTwoWithNine"
    putStrLn "- replicate'"
    putStrLn "- sign"
    putStrLn "- take'"
    putStrLn "- myCompare"

    print (Compare.myCompare 1 200)

    putStrLn "The end"
