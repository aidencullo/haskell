firstEven :: [Int] -> Int
firstEven = head . filter even


test :: IO ()
test =
  if firstEven [1, 3, 5, 7, 10] == 10
  then print "correct"
  else print "incorrect"
