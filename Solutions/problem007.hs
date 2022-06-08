-- Solution to problem 007
-- https://projecteuler.net/problem=7

module Main where

-- List of prime numbers.
primes :: [Int]
primes = 2:[x | x <- [3..], isPrime x]

-- Check whether number is prime.
isPrime :: Int -> Bool
isPrime x = all (\p -> x `mod` p > 0) (factorsToTry x)
            where
            factorsToTry x = takeWhile (\p -> p*p <= x) primes

-- Answer.
answer :: Int
answer = (primes)!!10000

main :: IO()
main = putStrLn (show (answer))

-- Explanation.
-- Implementation of the Sieve of Eratosthene as per Melissa E. O'Neill:
-- https://www.cs.hmc.edu/~oneill/papers/Sieve-JFP.pdf