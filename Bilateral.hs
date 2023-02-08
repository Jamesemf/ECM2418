import Data.List

{-Question 2.1-}
number :: [Int] -> Int
number [] =
  0
number (x : xs) =
  x * 10 ^ (length xs) + number xs

{-End Question 2.1-}

{-Question 2.2-}
splits :: [a] -> [([a], [a])]
splits xs =
  [splitAt n xs | n <- [1 .. ((length xs) -1)]]

perms :: [[Int]] -> [([Int],[Int])]
perms []
  = []
perms (x:xs)
  = splits x ++ perms xs

possibles :: [([Int], [Int])]
possibles =
  perms (permutations [1, 2, 3, 4, 5, 6, 7, 8, 9])

{-End Question 2.2-}

{-Question 2.3-}
isAcceptable :: ([Int], [Int]) -> Bool
isAcceptable (xs, ys) =
  reverse list == list && head list == 4 && last (digits (min x y)) == 3
  where
    x = number xs
    y = number ys
    list = digits (x * y)


acceptables :: [([Int], [Int])]
acceptables =
  acceptablesConsumer possibles

acceptablesConsumer :: [([Int], [Int])] -> [([Int], [Int])]
acceptablesConsumer = filter isAcceptable

{-breaks an integer into its digits -}
digits :: Int -> [Int]
digits 0 =
  []
digits x =
  digits (x `div` 10) ++ [x `mod` 10]

{-End Question 2.3-}

main = do
  putStrLn (show (acceptables))