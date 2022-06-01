-- Solution to problem 001
-- https://projecteuler.net/problem=1

l = [x | x <- [1..999], mod x 3 == 0 || mod x 5 == 0]
answer = sum l

-- Explanation:
-- 'answer' sums all elements in the list 'l' containg all integers from 1 to 999 (inclusive) either divisble by 3 or 5.