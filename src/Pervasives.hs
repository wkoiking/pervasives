{-# LANGUAGE NoImplicitPrelude #-}
module Pervasives
    -- * Basic functions
    ( Data.Function.id
    , (Data.Function..)
    , Data.Function.const
    , Data.Function.flip
    , (Data.Function.$)
    , (Prelude.$!)
    , (Data.Function.&)
    , Prelude.until
    , Prelude.asTypeOf
    , Prelude.seq
    , Prelude.map

    -- * Basic algebraic types
    
    -- ** Bool
    , Data.Bool.Bool(False, True)
    , (Data.Bool.&&)
    , (Data.Bool.||)
    , Data.Bool.not
    , Data.Bool.otherwise
    
    -- ** Maybe
    , Data.Maybe.Maybe(Nothing, Just)
    , Data.Maybe.maybe
    
    -- ** List
    , Data.List.break
    , Data.List.drop
    , Data.List.dropWhile
    , Data.List.dropWhileEnd
    , Data.List.filter
    , Data.List.group
    , Data.List.groupBy
    , Data.List.inits
    , Data.List.intercalate
    , Data.List.intersperse
    , Data.List.isPrefixOf
    , Data.List.isSuffixOf
    , Data.List.iterate
    , Data.List.iterate'
    , Data.List.lookup
    , Data.List.permutations
    , Data.List.repeat
    , Data.List.replicate
    , Data.List.reverse
    , Data.List.scanl
    , Data.List.scanr
    , Data.List.sort
    , Data.List.sortBy
    , Data.List.sortOn
    , Data.List.span
    , Data.List.splitAt
    , Data.List.subsequences
    , Data.List.tails
    , Data.List.take
    , Data.List.takeWhile
    , Data.List.transpose
    , Data.List.unfoldr
    , Data.List.unzip
    , Data.List.unzip3
    , Data.List.zip
    , Data.List.zip3
    , Data.List.zipWith
    , Data.List.zipWith3
    -- ** Tuple
    , Data.Tuple.fst
    , Data.Tuple.snd
    , Data.Tuple.curry
    , Data.Tuple.uncurry
    , Data.Tuple.swap
    
    -- ** Either
    , Data.Either.Either(Left, Right)
    , Data.Either.either
    , Data.Either.isLeft
    , Data.Either.isRight
    , Data.Either.lefts
    , Data.Either.rights
    , Data.Either.partitionEithers
    
    -- ** Char and String
    , Prelude.Char
    , Prelude.String

    -- * Numeric types
    , Prelude.Int
    , Prelude.Double
    
    -- * Equality and ordering
    
    -- ** Eq
    , Data.Eq.Eq((==), (/=))
    
    -- ** Ord
    , Data.Ord.Ord(compare, (<), (>), (<=), (>=), max, min)
    , Data.Ord.Ordering(LT,GT,EQ)
    , Data.Ord.comparing

    -- * IOException
    , Control.Exception.Base.IOException
    , Prelude.userError
    
    -- * IO
    , System.IO.IO
    , System.IO.FilePath
    , System.IO.putChar
    , System.IO.putStr
    , System.IO.putStrLn
    , System.IO.getChar
    , System.IO.getLine
    , System.IO.getContents
    , System.IO.readFile
    , System.IO.writeFile
    , System.IO.appendFile
    , System.IO.appendFile
    -- Specialized functions
    , foldr
    , foldr'
    , foldl
    , foldl'
    , product
    , sum
    , product_float
    , sum_float
    , null
    , length
    , concatMap
    , all
    , any
    , or
    , and
    , find
    , when
    , unless
    , replicateM
    , replicateM_
    , mapM
    , mapM_
    , forM
    , forM_
    , sequence
    , sequence_
    , return
    , forever
    , max_int
    , min_int
    , float_of_int
    , int_of_float
    , string_of_bool
    , string_of_int
    , string_of_float
    , (+)
    , (-)
    , (*)
    , (^)
    , negate
    , abs
    , signum
    , subtract
    , even
    , odd
    , succ
    , pred
    , (+.)
    , (-.)
    , (*.)
    , (/)
    , negate_float
    , abs_float
    , signum_float
    , subtract_float
    , quot
    , rem
    , div
    , mod
    , quotRem
    , divMod
    , pi
    , exp
    , log
    , sqrt
    , (**)
    , logBase
    , sin
    , cos
    , tan
    , asin
    , acos
    , atan
    , sinh
    , cosh
    , tanh
    , asinh
    , acosh
    , atanh
    , properFraction
    , truncate
    , round
    , ceiling
    , floor
    , floatDigits
    , floatRange
    , exponent
    , significand
    , scaleFloat
    , isNaN
    , isInfinite
    , isDenormalized
    , isNegativeZero
    , isIEEE
    , atan2
    ) where

import qualified Control.Monad
import qualified Control.Monad.Fail
import qualified Data.Bits
import qualified Data.Bool
import qualified Data.Either
import qualified Data.Eq
import qualified Data.Foldable
import qualified Data.Function
import qualified Data.Int
import qualified Data.Kind
import qualified Data.List
import qualified Data.Maybe
import qualified Data.Monoid
import qualified Data.Ord
import qualified Data.Tuple
import Prelude(Bool, Int, Double, Maybe, Either, IO, String, Eq)
import qualified Prelude
import qualified System.IO
import Control.Exception.Base(IOException)
import qualified Control.Exception.Base

elem :: Eq a => a -> [a] -> Bool
elem = Data.Foldable.elem

notElem :: Eq a => a -> [a] -> Bool
notElem = Data.Foldable.notElem

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr = Data.Foldable.foldr

foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' = Data.Foldable.foldr'

foldl :: (b -> a -> b) -> b -> [a] -> b
foldl = Data.Foldable.foldl

foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' = Data.Foldable.foldl'

product :: [Int] -> Int
product = foldl' (*) 1

sum :: [Int] -> Int
sum = foldl' (+) 0

product_float :: [Double] -> Double
product_float = foldl' (*.) 1

sum_float :: [Double] -> Double
sum_float = foldl' (+.) 0

null :: [a] -> Bool
null = Data.Foldable.null

length :: [a] -> Int
length = Data.Foldable.length

concatMap :: (a -> [b]) -> [a] -> [b]
concatMap = Data.Foldable.concatMap

all :: (a -> Bool) -> [a] -> Bool
all = Data.Foldable.all

any :: (a -> Bool) -> [a] -> Bool
any = Data.Foldable.any

or :: [Bool] -> Bool
or = Data.Foldable.or

and :: [Bool] -> Bool
and = Data.Foldable.and

find :: (a -> Bool) -> [a] -> Maybe a 
find = Data.Foldable.find

-- IO Monad
when :: Bool -> IO () -> IO ()
when = Control.Monad.when

unless :: Bool -> IO () -> IO ()
unless = Control.Monad.unless

replicateM :: Int -> IO a -> IO [a]
replicateM = Control.Monad.replicateM

replicateM_ :: Int -> IO a -> IO ()
replicateM_ = Control.Monad.replicateM_

mapM :: (a -> IO b) -> [a] -> IO [b]
mapM = Control.Monad.mapM

mapM_ :: (a -> IO b) -> [a] -> IO ()
mapM_ = Control.Monad.mapM_

forM :: [a] -> (a -> IO b) -> IO [b]
forM = Control.Monad.forM

forM_ :: [a] -> (a -> IO b) -> IO ()
forM_ = Control.Monad.forM_

sequence :: [IO a] -> IO [a]
sequence = Control.Monad.sequence

sequence_ :: [IO a] -> IO ()
sequence_ = Control.Monad.sequence_

return :: a -> IO a
return = Control.Monad.return

forever :: IO a -> IO b
forever = Control.Monad.forever

max_int :: Int
max_int = Prelude.maxBound
min_int :: Int
min_int = Prelude.minBound

-- max_float :: Double
-- min_float :: Double

float_of_int :: Int -> Double
float_of_int = Prelude.fromIntegral
int_of_float :: Double -> Int
int_of_float = truncate

-- int_of_char :: Char -> Int
-- char_of_int :: Int -> Char

string_of_bool :: Bool -> String
string_of_bool = Prelude.show
-- bool_of_string :: String -> Bool
-- bool_of_string_opt :: String -> Maybe Bool

string_of_int :: Int -> String
string_of_int = Prelude.show
-- int_of_string :: String -> Int
-- int_of_string_opt :: String -> Maybe Int

string_of_float :: Double -> String
string_of_float = Prelude.show
-- float_of_string : String -> Double
-- float_of_string_opt : String -> Maybe  Float

(+) :: Int -> Int -> Int
(+) = (Prelude.+)
(-) :: Int -> Int -> Int
(-) = (Prelude.-)
(*) :: Int -> Int -> Int
(*) = (Prelude.*)
(^) :: Int -> Int -> Int
(^) = (Prelude.^)

infixl 7  *
infixl 6  +, -
infixr 8  ^

negate :: Int -> Int
negate = Prelude.negate
abs :: Int -> Int
abs = Prelude.abs
signum :: Int -> Int
signum = Prelude.signum
subtract :: Int -> Int -> Int
subtract = Prelude.subtract
even :: Int -> Bool
even = Prelude.even
odd :: Int -> Bool
odd = Prelude.odd
succ :: Int -> Int
succ = Prelude.succ
pred :: Int -> Int
pred = Prelude.pred

(+.) :: Double -> Double -> Double
(+.) = (Prelude.+)
(-.) :: Double -> Double -> Double
(-.) = (Prelude.-)
(*.) :: Double -> Double -> Double
(*.) = (Prelude.*)
(/) :: Double -> Double -> Double 
(/) = (Prelude./)

infixl 7  *.
infixl 6  +., -.
infixl 7  /

negate_float :: Double -> Double
negate_float = Prelude.negate
abs_float :: Double -> Double
abs_float = Prelude.abs
signum_float :: Double -> Double
signum_float = Prelude.signum
subtract_float :: Double -> Double -> Double
subtract_float = Prelude.subtract

quot :: Int -> Int -> Int
quot = Prelude.quot
rem :: Int -> Int -> Int
rem = Prelude.rem
div :: Int -> Int -> Int
div = Prelude.div
mod :: Int -> Int -> Int
mod = Prelude.mod
quotRem :: Int -> Int -> (Int, Int)
quotRem = Prelude.quotRem
divMod :: Int -> Int -> (Int, Int)
divMod = Prelude.divMod

pi :: Double
pi = Prelude.pi
exp :: Double -> Double
exp = Prelude.exp
log :: Double -> Double
log = Prelude.log
sqrt :: Double -> Double
sqrt = Prelude.sqrt
(**) :: Double -> Double -> Double
(**) = (Prelude.**)
infixr 8 **

logBase :: Double -> Double -> Double
logBase = Prelude.logBase
sin :: Double -> Double
sin = Prelude.sin
cos :: Double -> Double
cos = Prelude.cos
tan :: Double -> Double
tan = Prelude.tan
asin :: Double -> Double
asin = Prelude.asin
acos :: Double -> Double
acos = Prelude.acos
atan :: Double -> Double
atan = Prelude.atan
sinh :: Double -> Double
sinh = Prelude.sinh
cosh :: Double -> Double
cosh = Prelude.cosh
tanh :: Double -> Double
tanh = Prelude.tanh
asinh :: Double -> Double
asinh = Prelude.asinh
acosh :: Double -> Double
acosh = Prelude.acosh
atanh :: Double -> Double
atanh = Prelude.atanh

properFraction :: Double -> (Int, Double)
properFraction = Prelude.properFraction
truncate :: Double -> Int
truncate = Prelude.truncate
round :: Double -> Int
round = Prelude.round
ceiling :: Double -> Int
ceiling = Prelude.ceiling
floor :: Double -> Int
floor = Prelude.floor

floatDigits :: Double -> Int
floatDigits = Prelude.floatDigits
floatRange :: Double -> (Int, Int)
floatRange = Prelude.floatRange
-- decodeFloat :: Double -> (Integer, Int)
-- encodeFloat :: Integer -> Int -> Double
exponent :: Double -> Int
exponent = Prelude.exponent
significand :: Double -> Double
significand = Prelude.significand
scaleFloat :: Int -> Double -> Double
scaleFloat = Prelude.scaleFloat
isNaN :: Double -> Bool
isNaN = Prelude.isNaN
isInfinite :: Double -> Bool
isInfinite = Prelude.isInfinite
isDenormalized :: Double -> Bool
isDenormalized = Prelude.isDenormalized
isNegativeZero :: Double -> Bool
isNegativeZero = Prelude.isNegativeZero
isIEEE :: Double -> Bool
isIEEE = Prelude.isIEEE
atan2 :: Double -> Double -> Double
atan2 = Prelude.atan2

--
fail :: String -> IO a
fail = Prelude.fail
throw :: IOException -> IO a
throw = Control.Exception.Base.throwIO
catch :: IO a -> (IOException -> IO a) -> IO a
catch = Control.Exception.Base.catch
handle :: (IOException -> IO a) -> IO a -> IO a
handle = Control.Exception.Base.handle
try :: IO a -> IO (Either IOException a)
try = Control.Exception.Base.try
onException :: IO a -> IO b -> IO a
onException = Control.Exception.Base.onException
evaluate :: a -> IO a
evaluate = Control.Exception.Base.evaluate
bracket :: IO a -> (a -> IO b) -> (a -> IO c) -> IO c
bracket = Control.Exception.Base.bracket
bracket_ :: IO a -> IO b -> IO c -> IO c
bracket_ = Control.Exception.Base.bracket_
bracketOnError :: IO a -> (a -> IO b)-> (a -> IO c) -> IO c
bracketOnError = Control.Exception.Base.bracketOnError
finally :: IO a -> IO b -> IO a
finally = Control.Exception.Base.finally
