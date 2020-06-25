module Data.BodyArray where

import Data.Generic.Rep (class Generic)
import Data.Newtype (class Newtype)
import Foreign.Generic (class Encode, defaultOptions, genericEncode)

newtype BodyArray a
  = BodyArray (Array a)

derive instance newtypeBodyArray :: Newtype (BodyArray a) _

derive instance genericBodyArray :: Generic (BodyArray a) _

instance encodeBodyArray :: Encode a => Encode (BodyArray a) where
  encode = genericEncode defaultOptions { unwrapSingleConstructors = true }
