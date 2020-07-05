{-# LANGUAGE NoImplicitPrelude #-}
module Main where

import Pervasives

main :: IO ()
main = do
    let x = 1 :: Int
    putStrLn $ string_of_int x
