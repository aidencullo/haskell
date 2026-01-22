-- How many elements does it take for the sum of the square roots of all natural numbers to exceed 1000

sumSqrt :: Int
sumSqrt = length(takeWhile (<1000) (scanl1 (+) (map (sqrt) [1..]))) + 1

-- flip' f = \x y -> f y x
flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = 
  let g x y = f y x
  in g
  
(.:) :: (c -> a) -> (b -> c) -> (b -> a)
(.:) f g = \x -> f $ g x


composition = replicate 100 (product (map (*3) (zipWith max [1,2,3,4,5] [4,5,6,7,8])))
compositionDot = replicate 100 . product .  map (*3) . zipWith max [1,2,3,4,5] $ [4,5,6,7,8]


-- write this in point-free style
fn :: (RealFrac a, Floating a, Ord a, Integral b) => a -> b
fn x = ceiling (negate (tan (cos (max 50 x))))  

fn' :: (RealFrac a, Floating a, Ord a, Integral b) => a -> b
fn' = ceiling . negate . tan . cos . max 50

test :: Bool
test = all (\x -> fn' x == fn x) [1..100000]

-- write this in point free style
oddSquareSum :: Integer  
oddSquareSum = sum (takeWhile (<10000) (filter odd (map (^2) [1..])))  

oddSquareSum' :: Integer  
oddSquareSum' = sum . takeWhile (<10000) . filter odd . map (^2) $ [1..]

testOdd :: Bool
testOdd = oddSquareSum' == oddSquareSum

oddSquareSumReadable :: Integer  
oddSquareSumReadable = let oddSquares = filter odd $ map (^2) [1..]
                           belowLimit = takeWhile (<10000) oddSquares
                         in sum belowLimit

testOddReadable :: Bool
testOddReadable = oddSquareSumReadable == oddSquareSum
