module dev where

import App (app)

main :: IO ()
main = scotty 3000 app
