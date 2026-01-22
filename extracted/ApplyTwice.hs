module ApplyTwice where

import Debug.Trace

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

-- Test cases that run when module is loaded
testResults :: String
testResults = trace "Running ApplyTwice tests..." $
    "applyTwice (+3) 10 = " ++ show (applyTwice (+3) 10) ++ "\n" ++
    "applyTwice (++ \" HAHA\") \"HEY\" = " ++ show (applyTwice (++ " HAHA") "HEY") ++ "\n" ++
    "applyTwice (\"HAHA \" ++) \"HEY\" = " ++ show (applyTwice ("HAHA " ++) "HEY") ++ "\n" ++
    "applyTwice (multThree 2 2) 9 = " ++ show (applyTwice (multThree 2 2) 9) ++ "\n" ++
    "applyTwice (3:) [1] = " ++ show (applyTwice (3:) [1])

-- Helper function for testing multThree
multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x * y * z

-- Force evaluation of test results when module is loaded
_ = trace testResults ()

