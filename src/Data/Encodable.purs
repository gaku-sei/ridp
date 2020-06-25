module Data.Encodable where

import Prelude (($), (<<<), const, pure)
import Data.Generic.Rep (class Generic)
import Foreign.Generic (class Encode, defaultOptions, encodeJSON, genericEncode)
import HTTPure.Body as HTTPure.Body
import HTTPure.Headers as HTTPure.Headers

newtype Encodable a
  = Encodable a

derive instance genericEncodable :: Generic (Encodable a) _

instance encodeEncodable :: Encode a => Encode (Encodable a) where
  encode = genericEncode defaultOptions { unwrapSingleConstructors = true }

instance bodyEncode :: Encode a => HTTPure.Body.Body (Encodable a) where
  defaultHeaders = const $ pure HTTPure.Headers.empty
  write = HTTPure.Body.write <<< encodeJSON
