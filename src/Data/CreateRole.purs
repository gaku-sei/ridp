module Data.CreateRole where

import Data.Generic.Rep (class Generic)
import Foreign.Generic (class Decode, defaultOptions, genericDecode)

data CreateRole
  = CreateRole { name :: String }

derive instance genericCreateRole :: Generic CreateRole _

instance decodeCreateRole :: Decode CreateRole where
  decode = genericDecode defaultOptions { unwrapSingleConstructors = true }
