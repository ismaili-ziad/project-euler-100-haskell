-- Solution to problem 013
-- https://projecteuler.net/problem=13

module Main where


-- Answer.
answer :: [String] -> Integer
answer = foldr (\ s -> (+) (read s :: Integer)) 0

main :: IO()
main = do 
    file <- readFile "../Files/text013.txt"
    let l = lines file
    print (read (take 10 (show (answer l))) :: Int)

-- Explanation.
-- We can simply exploit Haskell's type system. The type
-- 'Integer' is unbounded, giving us the freedom to sum integers
-- without considering their lengths. The function 'answer' simply
-- loops through each string in the file and converts it into an 
-- Integer (read :: Integer) to sum it.