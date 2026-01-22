module Take where

take' :: Int -> [a] -> [a]
take' 0 _ = []
take' _ [] = error "cannot take from an empty array"
take' n (x:xs) = x:take' (n - 1) xs