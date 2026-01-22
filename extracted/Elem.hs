elem' :: (Eq a)=>a->[a]->Bool
elem' x xs = foldl (\inList y -> inList || y == x) False xs