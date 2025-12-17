import Data.List
import Data.Char
import Data.Function
import qualified Data.Map as Map

-- Sample datatype
data MyBool = MyTrue | MyFalse

-- Typeclass instance
instance Eq MyBool where
    MyTrue  == MyTrue  = True
    MyFalse == MyFalse = True
    _       == _       = False

-- Using Data.List
numUniques :: Eq a => [a] -> Int
numUniques = length . nub

-- Using Data.Map
myMap :: Map.Map Int Char
myMap = Map.fromList [(1,'a'), (2,'b')]

filtered :: Map.Map Int Char
filtered = Map.filter (== 'a') myMap

-- Shape datatype
data Shape = Circle Float | Rectangle Float Float

c1 :: Shape
c1 = Circle 3.0

r1 :: Shape
r1 = Rectangle 4.0 5.0

-- allSame function
allSame :: Eq a => [a] -> Bool
allSame xs = length (nub xs) == 1

-- Tests
testAllSame1, testAllSame2, testAllSame3, testAllSame4 :: Bool
testAllSame1 = allSame (replicate 10 10)
testAllSame2 = allSame (replicate 10 100)
testAllSame3 = allSame [1..10] == False
testAllSame4 = allSame (take 100 $ repeat 10)

testAllSames :: [Bool]
testAllSames = [testAllSame1, testAllSame2]

testAllSameOverall :: Bool
testAllSameOverall = and testAllSames

-- Let's use a fold to implement searching a list for a sub list.
search :: (Eq a) => [a] -> [a] -> Bool
search needle haystack =
  let nLen = length needle
  in foldl (\acc x -> if take nLen x == needle then True else acc) False (tails haystack)


-- find takes a list and a predicate and returns the first element that satisfies the predicate.
first = let stock = [(994.4,2008,9,1),(995.2,2008,9,2),(999.2,2008,9,3),(1001.4,2008,9,4),(998.3,2008,9,5)] in find (\(val,y,m,d) -> val > 1000) stock



-- avg :: Fractional a => [a] -> a
avg xs = sum xs / (genericLength xs)

-- causes below error
-- avg' xs = sum xs / (length xs)


--     • Could not deduce ‘Fractional Int’ arising from a use of ‘/’
--       from the context: Foldable t
--         bound by the inferred type of avg' :: Foldable t => t Int -> Int
--         at modules.hs:64:1-30
--     • In the expression: sum xs / (length xs)
--       In an equation for ‘avg'’: avg' xs = sum xs / (length xs)
--    |
-- 64 | avg' xs = sum xs / (length xs)


-- import Data.List (groupBy)

groupByExample = groupBy (==) [1,1,2,2,2,3,1,1] 
-- Result: [[1,1],[2,2,2],[3],[1,1]]


groupByNormal = groupBy (\x y -> (x > 0) == (y > 0))
groupByUsingOn = groupBy ((==) `on` (> 0))
values = [-4.3, -2.4, -1.2, 0.4, 2.3, 5.9, 10.5, 29.1, 5.3, -2.4, -14.5, 2.9, 2.3]
testOn = groupByNormal values == groupByUsingOn values


-- ghci> groupBy ((==) `on` isSpace) "hey folks its me"  
-- ["hey"," ","folks"," ","its"," ","me"]  
-- ghci>  
-- Hmmm, well, it kind of does what words does but we're left with elements of only spaces. Hmm, whatever shall we do? I know, let's filter that sucker.
groups = groupBy ((==) `on` isSpace) "hey folks its me"
filteredGroups = filter (not . isSpace . head) groups



-- -- GOAL -- caesar cipher
-- ghci> encode 3 "Heeeeey"  
-- "Khhhhh|"  
-- ghci> encode 4 "Heeeeey"  
-- "Liiiii}"  
-- ghci> encode 1 "abcd"  
-- "bcde"  
-- ghci> encode 5 "Marry Christmas! Ho ho ho!"  

encode :: Int -> String -> String
encode shift msg = let ords = map ord msg
                       shifted = map (+ shift) ords
                   in map chr shifted
testEncode = encode 5 "Marry Christmas! Ho ho ho!" == "Rfww~%Hmwnxyrfx&%Mt%mt%mt&"

-- decode :: Int -> String -> String
-- decode shift msg = let ords = map ord msg
--                        shifted = map (+ (-shift)) ords
--                    in map chr shifted

decode :: Int -> String -> String
decode shift = encode (negate shift)

testDecode = decode 5 "Rfww~%Hmwnxyrfx&%Mt%mt%mt&" == "Marry Christmas! Ho ho ho!"
testEncodeDecode = decode 5 (encode 5 "Marry Christmas! Ho ho ho!") == "Marry Christmas! Ho ho ho!"





phoneBook = 
    [("amelia","555-2938")  
    ,("freya","452-2928")  
    ,("isabella","493-2928")  
    ,("neil","205-2928")  
    ,("roald","939-8282")  
    ,("tenzing","853-2492")  
    ]  
-- Let's make a function that looks up some value given a key.
-- lookUpValue =  head . filter
-- lookUpValue key =  (snd . head . filter) (\(k, v) -> k == key) phoneBook
-- firsts = map fst phoneBook
lookUpValue :: (a -> Bool) -> [a] -> a
lookUpValue p = head . filter p
