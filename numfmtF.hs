#! /usr/bin/env runhaskell

module Main where

import System.Environment

newtype NumFmt = NumFmt [ (Integer, String) ]

instance Show NumFmt where
    show (NumFmt []) = ""
    show (NumFmt ((i,s):xs)) = (if i /= 0 then show i ++ s ++ " " else "") ++ show (NumFmt xs)

suffixes = [ "TiB", "GiB", "MiB", "KiB", "B" ]
bases = reverse $ take (length suffixes) $ map (1024^) [0,1..]

main = do
    xs <- (fmap . fmap) (read :: String -> Integer) getArgs
    sequence $ fmap (print . factor) xs

    where

    factor :: Integer -> NumFmt
    factor = NumFmt . factor' suffixes bases
    factor' [] _ _ = []
    factor' (s:ss) (b:bs) x = let (q,r) = x `divMod` b in (q, s) : factor' ss bs r

