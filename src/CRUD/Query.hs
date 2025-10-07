{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveGeneric #-}

module CRUD.Query where

import Database.SQLite.Simple (Connection, FromRow, ToRow, open, close, execute, query_)
import GHC.Generics

data Person = Person {
    personId   :: Int,
    personName :: String,
    age        :: Int
} deriving (Eq, Show, FromRow, ToRow, Generic)

getConn :: IO Connection
getConn = open "./haskell-servantDB"

fetchPersonsQ :: IO [Person]
fetchPersonsQ = do
    conn <- getConn
    personList <- query_ conn "SELECT * FROM persons;"
    close conn
    pure personList

insertPersonQ :: Person -> IO ()
insertPersonQ person = do
    conn <- getConn
    execute conn "INSERT INTO persons (person_id, person_name, age) VALUES (?, ?, ?)" person --(personName person, age person)
    close conn

-- updatePersonQ :: Person -> IO ()
-- updatePersonQ person = do
--     conn <- getConn
--     execute conn "UPDATE persons SET person_name = ?, age = ? WHERE person_id = ?" (personName, age, personId)
--     close conn
--     where
--         personId = personId person
--         personName = personName person
--         age = age person

test :: IO ()
test = putStrLn "Hello from Query"
