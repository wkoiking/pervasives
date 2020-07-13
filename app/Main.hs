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
    putStrLn str

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
    if 10 < num
        then do
            putStrLn "You input: Large number"
        else do
            putStrLn ("You input: " ++ string_of_int num)

main5 :: IO ()
main5 = do
    str <- getLine
    let mNum :: Maybe Int
        mNum = int_of_string_opt str
    case mNum of
        Just num -> do
            putStrLn (string_of_int (f num))
        Nothing  -> do
            putStrLn "You need to input a number ... bye!"
 where f :: Int -> Int
       f n = n + n

main6 :: IO ()
main6 = do
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

-- ���������_
myFloatNumber :: Float
myFloatNumber = 2 / 3

-- ����
myChar :: Char
myChar = 'A'

-- ������
myString :: String
myString = "Hello World"

-- �֐�
myFunction :: Int -> Int
myFunction n = n * n * n

myFunction2 :: Int -> Int
myFunction2 = (\ n -> n * n * n)

-- ���������葱��
printNumber :: Int -> IO ()
printNumber n = do
    putStrLn "Printing number ..."
    putStrLn (string_of_int n)

main7 :: IO ()
main7 = do
    -- for���[�v
    forM_ [1,2,3,4,5] printNumber

main8 :: IO ()
main8 = do
    -- �����֐����g����for���[�v����
    forM_ [1,2,3,4,5] $ \ n -> do
        putStrLn "Printing number ..."
        putStrLn (string_of_int n)

main9 :: IO ()
main9 = do
    -- ������
    vNum <- newIORef 0 :: IO (IORef Int)

    -- �ϐ���ǂ�
    n1 <- readIORef vNum
    putStrLn "Initial number ..."
    putStrLn (string_of_int n1)

    -- �ϐ��ɒl��������
    writeIORef vNum 10
    n2 <- readIORef vNum
    putStrLn "Substituted number ..."
    putStrLn (string_of_int n2)

    -- �ϐ���ύX����
    modifyIORef vNum increment
    n3 <- readIORef vNum
    putStrLn "Modified number ..."
    putStrLn (string_of_int n3)
 where increment n = n + 1
