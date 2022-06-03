-- Solution to problem 006
-- https://projecteuler.net/problem=6

module Main where

-- Sum of the squares of the first one hundred natural numbers.
q :: Int
q = sum [x^2 | x <- [1..100]]

-- Square of the sum.
s :: Int
s = (sum [1..100])^2

-- Answer.
answer = s-q

main :: IO()
main = putStrLn (show (answer))