{-# LANGUAGE OverloadedStrings #-}

module App (app) where

import Control.Applicative
import Control.Monad.IO.Class (liftIO)
import qualified Data.Aeson as A
import Data.Text.Lazy (Text)

import Web.Scotty
import Model (getProducts)

app :: ScottyM ()
app = do
  get "/:name" $ do
    name <- param "name"
    products <- liftIO $ getProducts name
    json products
