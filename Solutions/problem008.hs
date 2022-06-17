-- Solution to problem 008
-- https://projecteuler.net/problem=8

module Main where

import Data.Char(digitToInt)

-- Multiply all digits of a string.
mult :: String -> Int
mult "" = 1
mult (s:ss) = digitToInt s * mult ss

-- Product of the first 13 digits of a string.
prod :: String -> Int
prod ss = if length ss < 13 then 0 else
    mult (take 13 ss)

-- Answer.
answer :: String -> Int -> Int
answer "" m = m
answer (s:ss) m = do
    let p = prod (s:ss)
    if p > m then answer ss p else answer ss m


main :: IO()
main = do 
    file <- readFile "../Files/text008.txt"
    let l = concat (lines file)
    print (answer l 0)