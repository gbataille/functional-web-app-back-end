{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeOperators #-}

module App where

import Data.Aeson (ToJSON)
import GHC.Generics (Generic)
import Network.Wai (Application)
import Network.Wai.Handler.Warp (run)
import Servant

type StatusAPI = "api" :> "status" :> Get '[JSON] Status

data Status = Status {
  status :: String
} deriving (Eq, Show, Generic)
instance ToJSON Status

statusOk :: Status
statusOk = Status "OK"

server :: Server StatusAPI
server = return statusOk

statusAPI :: Proxy StatusAPI
statusAPI = Proxy

webapp :: Application
webapp = serve statusAPI server

runServer :: IO ()
runServer = do
    putStrLn "You can reach the sample app at http://localhost:8080/"
    putStrLn ""
    putStrLn "Stop the web server with Ctrl+c"
    putStrLn ""
    run 8080 webapp
