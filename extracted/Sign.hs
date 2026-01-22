module Sign where

sign :: Int -> String
sign x
  | x < 0 = "Negative"
  | x > 0 = "Positive"
  | x == 0 = "Zero"
