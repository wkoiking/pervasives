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
    -- 標準出力
    putStrLn str

-- let と where による変数束縛
main3 :: IO ()
main3 = do
    str <- getLine
    let num :: Int      -- スコープ内だけで使用できる変数を定義
        num = int_of_string str
    putStrLn (string_of_int (f num))
 where f :: Int -> Int  -- スコープ内だけで使用できる関数を定義
       f n = n + n

main4 :: IO ()
main4 = do
    str <- getLine
    let num :: Int
        num = int_of_string str
    -- ifによる条件分岐
    if 10 < num
        then do
            putStrLn "You input: Large number"
        else do
            putStrLn ("You input: " ++ string_of_int num)

-- 繰り返し処理（再帰）
main5 :: IO ()
main5 = do
    str <- getLine
    if str == "exit"
        then do
            putStrLn "Bye!"
        else do
            putStrLn str
            main6

-- 整数 .. -2, -1, 0, 1, 2 ..
myNumber :: Int
myNumber = 1

-- 真偽値 (True | False)

myBool :: Bool
myBool = True

-- リスト
myList :: [Int]
myList = [1,2,3,4,5]

myList2 :: [Int]
myList2 = 1 : 2 : 3 : 4 : []

-- オプション型 (Just x | Nothing)
myJust :: Maybe Int
myJust = Just 1

myNothing :: Maybe Int
myNothing = Nothing

-- e.g. myList == myList2 ==> True

-- 浮動小数点数
myFloatNumber :: Float
myFloatNumber = 2 / 3

-- 文字
myChar :: Char
myChar = 'A'

-- 文字列
myString :: String
myString = "Hello World"

myString2 :: String
myString2 = ['H', 'e', 'l', 'l', 'o', ' ', 'W', 'o', 'r', 'l', 'd']

-- ※HaskellではStringはCharのリストなので、myString == myString2 ==> True

-- タプル
myTuple :: (Int, String)
myTuple = (1, "Hello")

-- 関数
myFunction :: Int -> Int
myFunction n = n * n * n

-- 無名関数
myFunction2 :: Int -> Int
myFunction2 = (\ n -> n * n * n)

-- ユーザー定義の型

-- * 列挙型
data Color = Red | Blue | Black | White

myColor :: Color
myColor = Blue

-- * レコード型
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

-- レコードラベルはアクセッサー関数になる
-- > :t name
-- name :: Person -> String
-- > :t age
-- age :: Person -> Int

-- e.g., name me ==> "Miyamoto Musashi"
--       age you ==> 35

-- パターン・マッチで関数を定義
string_of_person :: Person -> String
string_of_person (Person str i) = str ++ " :: " ++ string_of_int i ++ " " ++ "year"

-- * 列挙型とレコード型を混ぜた感じのやつ
data Shape
    = Rect (Float, Float) (Float, Float)
    | Circle (Float, Float) Float
    | Point (Float, Float)
    | Line (Float, Float) (Float, Float)

-- * 型変数を含む型の定義
data Option a    -- aのような小文字から始まるリテラルは型変数として扱われる
    = Some a
    | None

myMaybe :: Option Int
myMaybe = Some 1

-- * 再帰的な型の定義
data Exp
    = Val Int
    | Add Exp Exp
    | Mult Exp Exp

myExp :: Exp
myExp = Add (Val 1) (Mult (Val 2) (Val 3))

-- * 型変数を含む再帰的な型の定義
data MyList a
    = Cons a (MyList a)
    | Nill

myMyList :: MyList Int
myMyList = Cons 1 (Cons 2 (Cons 3 Nill))


-- パターンマッチによる分岐
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
    -- パターンマッチによる分岐
    case mNum of
        Just num -> do
            putStrLn (string_of_int (f num))
        Nothing  -> do
            putStrLn "You need to input a number ... bye!"
 where f :: Int -> Int
       f n = n + n

-- 返り値を伴うIOアクションの定義
getNumber :: IO (Maybe Int)
getNumber = do
    putStrLn "Please input number"
    str <- getLine
    return (int_of_string_opt str)

-- 引数を伴うIOアクションの定義
printNumber :: Int -> IO ()
printNumber n = do
    putStrLn "Printing number ..."
    putStrLn (string_of_int n)
    return ()  -- この場合、別にreturnは無くても良い

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
    -- forループ
    forM_ [1,2,3,4,5] printNumber

main9 :: IO ()
main9 = do
    -- 無名関数を使って、値を「n」に束縛してforループ処理
    forM_ [1,2,3,4,5] (\ n -> do
        putStrLn "Printing number ..."
        putStrLn (string_of_int n)
        )

main10 :: IO ()
main10= do
    -- 参照の初期化
    vNum <- newIORef 0 :: IO (IORef Int)

    -- 参照の中身を読む
    n1 <- readIORef vNum
    putStrLn "Initial number ..."
    putStrLn (string_of_int n1)

    -- 参照の中身を書き換える（値を代入する）
    writeIORef vNum 10
    n2 <- readIORef vNum
    putStrLn "Substituted number ..."
    putStrLn (string_of_int n2)

    -- 参照の中身を変更する
    modifyIORef vNum increment
    n3 <- readIORef vNum
    putStrLn "Modified number ..."
    putStrLn (string_of_int n3)
 where increment n = n + 1

-- 再帰を使ってリストを処理する関数を定義

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

-- ガードで条件分岐
factrial :: Int -> Int
factrial n
    | n == 0    = 1
    | otherwise = n * factrial (n - 1)

-- e.g., factrial 10 ==> 3628800
