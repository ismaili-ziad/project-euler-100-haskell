-- Solution to problem 012
-- https://projecteuler.net/problem=12

module Main where

-- List of prime numbers.
primes :: [Int]
primes = 2:[x | x <- [3..], isPrime x]

-- Check whether number is prime.
isPrime :: Int -> Bool
isPrime x = all (\p -> x `mod` p > 0) (factorsToTry x)
            where
            factorsToTry x = takeWhile (\p -> p*p <= x) primes

-- List of triangle numbers.
t :: [Int]
t = [div (x*(x+1)) 2 | x <- [1..]]

-- Prime factorisation of n by generating a list of all exponents.
getExp :: Int -> [Int] -> Int -> [Int]
getExp n [] i = [0]
getExp 1 (x:xs) i = x:xs
getExp n (x:xs) i = if mod n (primes!!i) == 0 then getExp (div n (primes!!i)) ((x+1):xs) i else
    getExp n (0:(x:xs)) (i+1)

-- Increment each element of a list by one.
increment :: [Int] -> [Int]
increment xs = [x+1 | x <- xs]

-- Answer.
answer :: Int
answer = head [x | x <- t, product (increment (getExp x [0] 0)) > 500]


main :: IO()
main = print answer

-- Explanation.
-- The number of divisiors of n is the product of all its exponents (after prime factorisation)
-- incremented. We can therefore generate a list of triangle numbers and search for the first one
-- that has more than 500 divisors using the previous method.