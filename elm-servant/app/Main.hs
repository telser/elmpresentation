{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeOperators #-}

module Main where

import ClassyPrelude hiding (Handler)
import Network.Wai.Handler.Warp
import Servant

import Lib

main :: IO ()
main = run 8081 app

dumbAPI :: Proxy API
dumbAPI = Proxy

app :: Application
app = serve dumbAPI server

server :: Server API
server = transform
  where
    transform :: Maybe String -> Handler (Headers '[Header "Access-Control-Allow-Origin" String] TransformMessage)
    transform txt = return $ addHeader "*" (TransformMessage $ case txt of
                               Nothing -> "illumos will brighten the way!"
                               Just t -> addTxt (pack t))
