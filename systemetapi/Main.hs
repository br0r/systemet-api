{-# LANGUAGE OverloadedStrings #-}

import Control.Applicative
import qualified Data.Aeson as A
import Data.Text.Lazy (Text)

import Web.Scotty
import Model (getProducts)

main :: IO ()
main = scotty 3000 $ do
  get "/:name" $ do
    name <- param "name"
    products <- getProducts name
    json (A.encode products)
