{-# LANGUAGE NoImplicitPrelude #-}
module Main where

import Pervasives

main :: IO ()
main = do
    -- 標準出力
    putStrLn "Hello World!"

main2 :: IO ()
main2 = do
    -- 標準入力
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

-- 整数
myNumber :: Int
myNumber = 1

-- リスト
myList :: [Int]
myList = [1,2,3,4,5]

-- 浮動小数点
myFloatNumber :: Float
myFloatNumber = 2 / 3

-- 文字
myChar :: Char
myChar = 'A'

-- 文字列
myString :: String
myString = "Hello World"

-- 関数
myFunction :: Int -> Int
myFunction n = n * n * n

myFunction2 :: Int -> Int
myFunction2 = (\ n -> n * n * n)

-- 引数を取る手続き
printNumber :: Int -> IO ()
printNumber n = do
    putStrLn "Printing number ..."
    putStrLn (string_of_int n)

main7 :: IO ()
main7 = do
    -- forループ
    forM_ [1,2,3,4,5] printNumber

main8 :: IO ()
main8 = do
    -- 無名関数を使ってforループ処理
    forM_ [1,2,3,4,5] $ \ n -> do
        putStrLn "Printing number ..."
        putStrLn (string_of_int n)

main9 :: IO ()
main9 = do
    -- 初期化
    vNum <- newIORef 0 :: IO (IORef Int)

    -- 変数を読む
    n1 <- readIORef vNum
    putStrLn "Initial number ..."
    putStrLn (string_of_int n1)

    -- 変数に値を代入する
    writeIORef vNum 10
    n2 <- readIORef vNum
    putStrLn "Substituted number ..."
    putStrLn (string_of_int n2)

    -- 変数を変更する
    modifyIORef vNum increment
    n3 <- readIORef vNum
    putStrLn "Modified number ..."
    putStrLn (string_of_int n3)
 where increment n = n + 1
