-- Solution to problem 004
-- https://projecteuler.net/problem=4

module Main where

-- List of all possible products of two 3-digit integers.
l :: [Int]
l = concat [map (*x) [100..999] | x <- [100..999]]

-- Check whether given number n is a palindrome.
isPalindrome :: String -> Bool
isPalindrome ss | length ss <= 1 = True
                | otherwise = if head ss == last ss then
                    isPalindrome (init (tail ss)) else False

-- Get the largest value of a list.
maxv :: Int -> [Int] -> Int
maxv m [] = m
maxv m (x:xs) = if x > m then maxv x xs else maxv m xs

-- Answer.
answer :: Int
answer = maxv 0 [x | x <- l, isPalindrome (show x)]

main :: IO()
main = putStrLn (show answer)

-- Explanation.
-- A list 'l' containing all possible products of two 3-digit integers is generated.
-- The answer is the largest element in the list of all palindromic elements in 'l'.