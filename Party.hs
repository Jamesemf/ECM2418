{-Question 1.1-}
digits :: Int -> [Int]
digits 0
    = []
digits x 
    = digits (x `div` 10) ++ [x `mod` 10]

{-End Question 1.1-}

{-Question 1.2-}

isPar :: Int -> Bool
isPar x
    | noDuplicates (digits x) && contains 0 (digits x) && bs `mod` as == 0 = True
    | otherwise = False
    where 
    d = digits x
    parts = splitAt 2 d
    as = addDigits (fst parts)
    bs = addDigits (snd parts)

contains :: Int -> [Int] -> Bool
contains e [] 
    = True
contains e (x:xs)
  | e == x = False
  | otherwise = contains e xs

addDigits :: [Int] -> Int
addDigits [] =
  0
addDigits (x : xs) =
  x * 10 ^ (length xs) + addDigits xs

noDuplicates :: [Int] -> Bool 
noDuplicates []
    = True
noDuplicates (x:xs)
    | x `elem` xs = False
    | otherwise = noDuplicates xs

pars :: [Int]
pars = parsConsumer parsProducer

parsProducer :: [Int]
parsProducer = [1111..9999]

parsConsumer :: [Int] -> [Int]
parsConsumer = filter isPar


{-End Question 1.2-}

{-Begin Question 1.3-}

isParty :: (Int, Int) -> Bool
isParty (x , y) 
    | noDuplicates list && isMultiple x missingVal && isMultiple y missingVal = True  
    | otherwise = False
    where
      xs = digits x
      ys = digits y
      list = merge xs ys
      missingVal = 45 - sum list

isMultiple :: Int -> Int -> Bool
isMultiple x y 
    | x `mod` y == 0 = True
    | otherwise = False

merge :: [Int] -> [Int] -> [Int]
merge xs []     
    = xs
merge [] ys 
    = ys
merge (x:xs) (y:ys)
    = x : y : merge xs ys

partys::[(Int,Int)]
partys = partyConsumer partyProducer

partyProducer::[(Int,Int)]
partyProducer 
    = [(a,b) | a <- pars , b <- pars]

partyConsumer::[(Int,Int)] -> [(Int,Int)]
partyConsumer = filter isParty 

{-End Question 1.3-}

main = do
  putStrLn (show (partys))
