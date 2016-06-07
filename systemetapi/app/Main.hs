import App (app)
import Web.Scotty

main :: IO ()
main = scotty 3000 app

