map' :: (a->a)->[a]->[a]
map' _ [] = []
map' f (x:xs) = f x : map' f xs

mapFoldr :: (a->b)->[a]->[b]
mapFoldr f xs = foldr (\x acc -> f x : acc) [] xs

mapFoldl :: (a->b)->[a]->[b]
mapFoldl f xs = foldl (\acc x -> f x : acc) [] (reverse xs)