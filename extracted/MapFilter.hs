-- Let's find the largest number under 100,000 that's divisible by 3829. To do that, we'll just filter a set of possibilities in which we know the solution lies.

largestNumberUnder100kDivisibleBy3829 :: Int
largestNumberUnder100kDivisibleBy3829 = maximum (filter (\x -> x `mod` 3829 == 0)[1..100000])

largestDivisible :: Int
largestDivisible = head (filter p [100000, 99999..])
  where p x = x `mod` 3829 == 0

test :: Bool
test = largestDivisible == largestNumberUnder100kDivisibleBy3829
