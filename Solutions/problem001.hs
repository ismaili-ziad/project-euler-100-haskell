
-- Solution to problem 001
-- https://projecteuler.net/problem=1

-- List of all integers from 1 to 999 (inclusive) divisible by both 3 and 5.
l :: [Int]
l = [x | x <- [1..999], mod x 3 == 0 || mod x 5 == 0]
-- Answer.
answer :: Int
answer = sum l

-- Explanation.
-- 'answer' sums all elements in the list 'l' containing all integers from 1 to 999 (inclusive) either divisible by 3 or by 5.