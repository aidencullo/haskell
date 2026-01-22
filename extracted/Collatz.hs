-- Now what we want to know is this: for all starting numbers between 1 and 100, how many chains have a length greater than 15? First off, we'll write a function that produces a chain:

chain :: Int -> [Int]
chain x
      | x == 1 = [x]
      | odd x = x : chain (3 * x + 1)
      | even x = x : chain (x `div` 2)


numChains :: Int
numChains = length (filter isLong (map chain [1..100]))
    where isLong x = length x > 15


-- using a lambda
numChainsLambda :: Int
numChainsLambda = length (filter (\x -> length x > 15) (map chain [1..100]))
