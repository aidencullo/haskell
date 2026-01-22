-- find the sum of all odd squares that are smaller than 10,000

sumOddsSmallerThan10000 :: Int
sumOddsSmallerThan10000 = sum (takeWhile (<10000) (filter odd (map (^2) [1..])))

-- using list comprehension

sumOddsSmallerThan10000List :: Int
sumOddsSmallerThan10000List = sum ( takeWhile (<10000) [ square | x <- [1..], let square = x ^ 2, odd square])
