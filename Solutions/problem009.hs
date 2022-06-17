-- Solution to problem 009
-- https://projecteuler.net/problem=9

module Main where

-- Define the tuple.
tup :: (Int, Int, Int)
tup = head [(a, b, 1000-a-b) | a <- [1..1000], b <- [1..1000], a+b <= 1000, a^2+b^2 == (1000-a-b)^2]

-- Answer.
answer :: (Int, Int, Int) -> Int
answer tuple@(a, b, c) = a*b*c

main :: IO()
main = print (answer tup)
