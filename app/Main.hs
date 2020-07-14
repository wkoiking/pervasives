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
    let num :: Int
        num = int_of_string str
    putStrLn (string_of_int (f num))
 where f :: Int -> Int
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

-- ����
myNumber :: Int
myNumber = 1

-- ���X�g
myList :: [Int]
myList = [1,2,3,4,5]

myList2 :: [Int]
myList2 = 1 : 2 : 3 : 4 : []

-- ���������_
myFloatNumber :: Float
myFloatNumber = 2 / 3

-- ����
myChar :: Char
myChar = 'A'

-- ������
myString :: String
myString = "Hello World"

-- �^�v��
myTuple :: (Int, String)
myTuple = (1, "Hello")

-- �֐�
myFunction :: Int -> Int
myFunction n = n * n * n

-- �����֐�
myFunction2 :: Int -> Int
myFunction2 = (\ n -> n * n * n)

-- ���������葱��
printNumber :: Int -> IO ()
printNumber n = do
    putStrLn "Printing number ..."
    putStrLn (string_of_int n)

-- ���[�U�[��`�̌^

-- * �񋓌^
data Color = Red | Blue | Black | White

-- * ���R�[�h�^
data Person = Person
    { name :: String
    , age :: Int
    }

-- -- * �^�ϐ����܂ނ���
-- data MyMaybe a
--     = MyJust a
--     | MyNothing
--
-- -- * �ċA�I�Ȍ^
-- data MyList a
--     = Cons a MyList
--     | Nill

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

main7 :: IO ()
main7 = do
    -- for���[�v
    forM_ [1,2,3,4,5] printNumber

main8 :: IO ()
main8 = do
    -- �����֐����g���āA�l�𑩔�����for���[�v����
    forM_ [1,2,3,4,5] $ \ n -> do
        putStrLn "Printing number ..."
        putStrLn (string_of_int n)

main9 :: IO ()
main9 = do
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
