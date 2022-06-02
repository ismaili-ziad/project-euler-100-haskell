-- Solution to problem 002
-- https://projecteuler.net/problem=2

-- Defining the pattern of a Fibonacci sequence.
fib_pattern :: Int -> Int -> [Int]
fib_pattern a b = a:(fib_pattern b (a+b))
-- Infinite list of the Fibonacci sequence starting with the values 1, and 1.
fibs :: [Int]
fibs = fib_pattern 1 1
-- Answer.
answer :: Int
answer = sum [x | x <- (takeWhile (\n -> (n <= 4000000)) fibs), mod x 2 == 0]

-- Explanation.
-- We sum up all values in a list containing all elements of the Fibonacci sequence below or equal to 4000000.
-- We make use of Haskell's Laziness to compute the relevant numbers in the list comprehension.