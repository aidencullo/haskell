product' :: (Num a) => [a] -> a
product' = foldr1 (*)

product2' :: (Num a) => [a] -> a
product2' = foldl1 (*)

product3' :: (Num a) => [a] -> a
product3' = foldl (*) 1

product4' :: (Num a) => [a] -> a
product4' = foldr (*) 1

oneToTen :: [Int]
oneToTen = [1..10]

testProducts :: Bool
testProducts =
    let expected = product oneToTen
    in  product' oneToTen  == expected
     && product2' oneToTen == expected
     && product3' oneToTen == expected
     && product4' oneToTen == expected
