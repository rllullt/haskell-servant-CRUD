{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveGeneric #-}

module CRUD.Query where

import Database.SQLite.Simple (Connection, open, FromRow, query_)
import GHC.Generics

data Person = Person {
    personId   :: Int,
    personName :: String,
    age        :: Int
} deriving (Eq, Show, FromRow, Generic)

getConn :: IO Connection
getConn = open "./haskell-servantDB"

fetchPersonsQ :: IO [Person]
fetchPersonsQ = do
    conn <- getConn
    personList <- query_ conn "SELECT * FROM person;"
    pure personList

test :: IO ()
test = putStrLn "Hello from Query"
