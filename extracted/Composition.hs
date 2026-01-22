addOne x = x + 1
add x y = x + y
addTo x = add x


double :: Int -> Int
double x = 2 * x

add10 = add 10

composition :: Int -> Int
composition = add10 . double

test = do
  let x = composition 10
  if x == 30 then print "correct"
  else print "incorrect"
