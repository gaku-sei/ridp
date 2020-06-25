module Data.Role where

import Data.Generic.Rep (class Generic)
import Foreign.Generic (class Encode, defaultOptions, genericEncode)

data Role
  = Role { id :: Int, name :: String }

derive instance genericRole :: Generic Role _

instance encodeRole :: Encode Role where
  encode = genericEncode defaultOptions { unwrapSingleConstructors = true }
