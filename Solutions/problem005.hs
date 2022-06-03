-- Solution to problem 005
-- https://projecteuler.net/problem=5

module Main where

-- Get list of all factors of n.
factors :: Integer -> [Integer]
factors n = [x | x <- [1..n], mod n x == 0]

-- Figure out whether n is prime.
isPrime :: Integer -> Bool
isPrime n = length (factors n) == 2

-- Definition of an infinite list of prime numbers.
primes :: [Integer]
primes = [x | x <- [1..], isPrime x]

-- Check whether given X is evenly divisible by all integers from 1 to N.
isDivisibleFrom1ToN :: Int -> Int -> Bool
isDivisibleFrom1ToN x 1 = True
isDivisibleFrom1ToN x n = if mod x n == 0 then
    isDivisibleFrom1ToN x (n-1) else False

-- Answer.
answer :: Int -> Int
answer n = if isDivisibleFrom1ToN n 20 then n else
    answer (n+prime20)

-- Product of all prime numbers below 20.
prime20 :: Int
prime20 = fromIntegral (product [x | x <- (takeWhile (<= 20) primes)])

main :: IO()
main = putStrLn (show (answer prime20))

-- Explanation.
-- It is at least known that all prime factors below 20 will appear in
-- the prime factorisation of the integer divisible by all positive non-zero
-- integers below 20. Therefore, we can search through by iterating positive integers
-- with a step of the product of all those prime numbers.