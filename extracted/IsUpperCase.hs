module IsUpperCase where

isUpperCase :: Char -> Bool
isUpperCase c = c `elem` ['A'..'Z']
