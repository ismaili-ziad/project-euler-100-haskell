-- Solution to problem 003
-- https://projecteuler.net/problem=3

-- Get list of all factors of n.
factors :: Integer -> [Integer]
factors n = [x | x <- [1..n], mod n x == 0]

-- Figure out whether n is prime.
isPrime :: Integer -> Bool
isPrime n = length (factors n) == 2

-- Definition of an infinite list of prime numbers.
primes :: [Integer]
primes = [x | x <- [1..], isPrime x]

-- Search algorithm.
search :: Integer -> Integer -> Int -> Integer
search x p i = if x == p then p else 
    (if mod x p == 0 then search (div x p) p i else
        search x (primes!!(i+1)) (i+1))

-- Answer.
answer :: Integer
answer = search 600851475143 2 0

-- Explanation.
-- We know that a number n is the largest prime factor of x when x/n only contains prime factors lesser than or equal to n.
-- The 'search' function starts from the first positive prime number (2) and attempts to divide it by 600851475143. If successful, it reattempts
-- with 2 again. If unsuccessful, it moves on to the next prime number. The function goes on until the divided number is equal to the prime number, suggesting that
-- there is no further possible prime factorisation, hence, the largest prime factor was reached.