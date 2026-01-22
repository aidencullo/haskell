head' :: [a] -> a
head' (x:_) = x
head' []    = error "empty list"

nums :: [Int]
nums = [1..]

test :: Bool
test = let expected1 = head nums
           expected2 = head' nums
       in expected1 == expected2
