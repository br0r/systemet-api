{-# LANGUAGE OverloadedStrings #-}
module Model where

import Control.Applicative
import Control.Monad
import Control.Monad.IO.Class (liftIO)
import Data.Text.Lazy (Text)

import Database.SQLite.Simple
import Database.SQLite.Simple.FromRow

data TestField = TestField Int String deriving (Show)

instance FromRow TestField where
  fromRow = TestField <$> field <*> field

getProducts :: String -> IO [(Int, Text)]
getProducts name = do
  conn <- open "../db/systemet.db"
  r <- query_ conn "SELECT id, name FROM products LIMIT 10" :: IO [(Int, Text)]
  close conn >> return r
