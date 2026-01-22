-- foldr on an infinite list

oneThroughFour = take 4 (foldr (:) [] [1..])

-- will return False (False && ..)
falseAndTrue :: Bool
falseAndTrue = foldr (&&) True (repeat False)

-- still false
falseAndFalse :: Bool
falseAndFalse = foldr (&&) False (repeat False)

-- infinite
trueAndFalse :: Bool
trueAndFalse = foldr (&&) False (repeat True)

-- infinite as well 
trueAndTrue :: Bool
trueAndTrue = foldr (&&) True (repeat True)


-- true
trueOrTrue = foldr (||) True (repeat True)

-- inf
falseOrTrue = foldr (||) True (repeat False)

-- inf
falseOrFalse = foldr (||) False (repeat False)

-- true
trueOrFalse = foldr (||) False (repeat True)



-- inf
trueOrFalseFoldl = foldl (||) False (repeat True)

-- inf
falseOrFalseFoldl = foldl (||) False (repeat False)

-- inf
trueAndTrueFoldl = foldl (&&) True (repeat True)