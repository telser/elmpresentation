{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeOperators #-}

module Lib
    ( addTxt
    , API
    , TransformMessage(..)
    ) where

import ClassyPrelude
import Data.Aeson.Types
import Servant

type API = "transform" :> QueryParam "txt" String :> Get '[JSON] (Headers '[Header "Access-Control-Allow-Origin" String] TransformMessage)

newtype TransformMessage = TransformMessage { msg :: Text }
  deriving Generic

instance ToJSON TransformMessage

addTxt :: Text -> Text
addTxt txt = txt ++ " adding some text! "
