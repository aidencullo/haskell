module Main where

import Debug.Trace

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

combine :: Int -> Float -> String
combine x y = show (addIntAndFloat x y)

addIntAndFloat :: Int -> Float -> Float
addIntAndFloat x y = fromIntegral x + y

zip' :: [a] -> [b] -> [(a, b)]
zip' xs ys = zipWith' (\x y -> (x, y)) xs ys

printResult :: IO ()
printResult = putStrLn $ show (zipWith (zipWith (*))
    [[1,2,3],[3,5,6],[2,3,4]]
    [[3,2,2],[3,4,5],[5,4,3]])

main :: IO ()
main = printResult
