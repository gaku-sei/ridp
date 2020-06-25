module Router where

import Prelude (($))
import Control.Monad.Except (runExcept)
import Control.Response (okA, okE)
import Data.CreateRole (CreateRole(..))
import Data.Either (Either(..))
import Data.Role (Role(..))
import Foreign.Generic (decodeJSON)
import HTTPure (Method(..), Request, ResponseM, notFound)

router :: Request -> ResponseM
router = case _ of
  { body, method: Post, path: [ "roles" ] }
    | Right (CreateRole { name }) <- runExcept $ decodeJSON body -> okE $ Role { id: 42, name }
  { method: Get, path: [ "roles" ] } ->
    okA
      [ Role { id: 42, name: "foo" }, Role { id: 43, name: "bar" } ]
  _ -> notFound
