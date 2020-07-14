{-# LANGUAGE NoImplicitPrelude #-}
module Main where

import Pervasives

main :: IO ()
main = do
    -- �W���o��
    putStrLn "Hello World!"

main2 :: IO ()
main2 = do
    -- �W������
    str <- getLine
    -- �W���o��
    putStrLn str

-- let �� where �ɂ��ϐ�����
main3 :: IO ()
main3 = do
    str <- getLine
    let num :: Int      -- �X�R�[�v�������Ŏg�p�ł���ϐ����`
        num = int_of_string str
    putStrLn (string_of_int (f num))
 where f :: Int -> Int  -- �X�R�[�v�������Ŏg�p�ł���֐����`
       f n = n + n

main4 :: IO ()
main4 = do
    str <- getLine
    let num :: Int
        num = int_of_string str
    -- if�ɂ���������
    if 10 < num
        then do
            putStrLn "You input: Large number"
        else do
            putStrLn ("You input: " ++ string_of_int num)

-- �J��Ԃ������i�ċA�j
main5 :: IO ()
main5 = do
    str <- getLine
    if str == "exit"
        then do
            putStrLn "Bye!"
        else do
            putStrLn str
            main6

-- ���� .. -2, -1, 0, 1, 2 ..
myNumber :: Int
myNumber = 1

-- �^�U�l (True | False)

myBool :: Bool
myBool = True

-- ���X�g
myList :: [Int]
myList = [1,2,3,4,5]

myList2 :: [Int]
myList2 = 1 : 2 : 3 : 4 : []

-- �I�v�V�����^ (Just x | Nothing)
myJust :: Maybe Int
myJust = Just 1

myNothing :: Maybe Int
myNothing = Nothing

-- e.g. myList == myList2 ==> True

-- ���������_��
myFloatNumber :: Float
myFloatNumber = 2 / 3

-- ����
myChar :: Char
myChar = 'A'

-- ������
myString :: String
myString = "Hello World"

myString2 :: String
myString2 = ['H', 'e', 'l', 'l', 'o', ' ', 'W', 'o', 'r', 'l', 'd']

-- ��Haskell�ł�String��Char�̃��X�g�Ȃ̂ŁAmyString == myString2 ==> True

-- �^�v��
myTuple :: (Int, String)
myTuple = (1, "Hello")

-- �֐�
myFunction :: Int -> Int
myFunction n = n * n * n

-- �����֐�
myFunction2 :: Int -> Int
myFunction2 = (\ n -> n * n * n)

-- ���[�U�[��`�̌^

-- * �񋓌^
data Color = Red | Blue | Black | White

myColor :: Color
myColor = Blue

-- * ���R�[�h�^
data Person = Person
    { name :: String
    , age :: Int
    }

me :: Person
me = Person "Miyamoto Musashi" 25

you :: Person
you = Person
    { name = "Sasaki Kojiro"
    , age = 32
    }

-- ���R�[�h���x���̓A�N�Z�b�T�[�֐��ɂȂ�
-- > :t name
-- name :: Person -> String
-- > :t age
-- age :: Person -> Int

-- e.g., name me ==> "Miyamoto Musashi"
--       age you ==> 35

-- �p�^�[���E�}�b�`�Ŋ֐����`
string_of_person :: Person -> String
string_of_person (Person str i) = str ++ " :: " ++ string_of_int i ++ " " ++ "year"

-- * �񋓌^�ƃ��R�[�h�^�������������̂��
data Shape
    = Rect (Float, Float) (Float, Float)
    | Circle (Float, Float) Float
    | Point (Float, Float)
    | Line (Float, Float) (Float, Float)

-- * �^�ϐ����܂ތ^�̒�`
data Option a    -- a�̂悤�ȏ���������n�܂郊�e�����͌^�ϐ��Ƃ��Ĉ�����
    = Some a
    | None

myMaybe :: Option Int
myMaybe = Some 1

-- * �ċA�I�Ȍ^�̒�`
data Exp
    = Val Int
    | Add Exp Exp
    | Mult Exp Exp

myExp :: Exp
myExp = Add (Val 1) (Mult (Val 2) (Val 3))

-- * �^�ϐ����܂ލċA�I�Ȍ^�̒�`
data MyList a
    = Cons a (MyList a)
    | Nill

myMyList :: MyList Int
myMyList = Cons 1 (Cons 2 (Cons 3 Nill))


-- �p�^�[���}�b�`�ɂ�镪��
string_of_color :: Color -> String
string_of_color col = case col of
    Red -> "red"
    Blue -> "blue"
    Black -> "black"
    White -> "white"

main6 :: IO ()
main6 = do
    str <- getLine
    let mNum :: Maybe Int
        mNum = int_of_string_opt str
    -- �p�^�[���}�b�`�ɂ�镪��
    case mNum of
        Just num -> do
            putStrLn (string_of_int (f num))
        Nothing  -> do
            putStrLn "You need to input a number ... bye!"
 where f :: Int -> Int
       f n = n + n

-- �Ԃ�l�𔺂�IO�A�N�V�����̒�`
getNumber :: IO (Maybe Int)
getNumber = do
    putStrLn "Please input number"
    str <- getLine
    return (int_of_string_opt str)

-- �����𔺂�IO�A�N�V�����̒�`
printNumber :: Int -> IO ()
printNumber n = do
    putStrLn "Printing number ..."
    putStrLn (string_of_int n)
    return ()  -- ���̏ꍇ�A�ʂ�return�͖����Ă��ǂ�

main7 :: IO ()
main7 = do
    putStrLn "Please input number"
    mNum <- getNumber
    case mNum of
        Just n -> if 10 < n
            then do
                putStrLn "Too Big"
            else do
                printNumber n
        Nothing -> putStrLn "Illegal input"

main8 :: IO ()
main8 = do
    -- for���[�v
    forM_ [1,2,3,4,5] printNumber

main9 :: IO ()
main9 = do
    -- �����֐����g���āA�l���un�v�ɑ�������for���[�v����
    forM_ [1,2,3,4,5] (\ n -> do
        putStrLn "Printing number ..."
        putStrLn (string_of_int n)
        )

main10 :: IO ()
main10= do
    -- �Q�Ƃ̏�����
    vNum <- newIORef 0 :: IO (IORef Int)

    -- �Q�Ƃ̒��g��ǂ�
    n1 <- readIORef vNum
    putStrLn "Initial number ..."
    putStrLn (string_of_int n1)

    -- �Q�Ƃ̒��g������������i�l��������j
    writeIORef vNum 10
    n2 <- readIORef vNum
    putStrLn "Substituted number ..."
    putStrLn (string_of_int n2)

    -- �Q�Ƃ̒��g��ύX����
    modifyIORef vNum increment
    n3 <- readIORef vNum
    putStrLn "Modified number ..."
    putStrLn (string_of_int n3)
 where increment n = n + 1

-- �ċA���g���ă��X�g����������֐����`

mySum :: [Int] -> Int
mySum (x : xs) = x + mySum xs
mySum [] = 0

-- e.g. mySum [1,2,3,4] ==> 10

myProduct :: [Int] -> Int
myProduct (x:xs) = x * myProduct xs
myProduct [] = 1

-- e.g. mySum [1,2,3,4] ==> 24

myZip :: [Int] -> [Int] -> [(Int, Int)]
myZip (x:xs) (y:ys) = (x, y) : myZip xs ys
myZip [] _ = []
myZip _ [] = []

-- e.g., myZip [1,2,3] [11, 12, 13] ==> [(1,11), (2,12), (3,13)]

-- �K�[�h�ŏ�������
factrial :: Int -> Int
factrial n
    | n == 0    = 1
    | otherwise = n * factrial (n - 1)

-- e.g., factrial 10 ==> 3628800
