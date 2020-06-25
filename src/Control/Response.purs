module Control.Response where

import Prelude ((<<<))
import Data.BodyArray (BodyArray(..))
import Data.Encodable (Encodable(..))
import Foreign.Generic (class Encode)
import HTTPure as HTTPure
import HTTPure.Response as HTTPure.Response

okE :: forall a. Encode a => a -> HTTPure.Response.ResponseM
okE = HTTPure.ok <<< Encodable

okA :: forall a. Encode a => Array a -> HTTPure.Response.ResponseM
okA = HTTPure.ok <<< Encodable <<< BodyArray
