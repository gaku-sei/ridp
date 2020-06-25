module Main where

import Effect.Console (log)
import HTTPure (ServerM, serve)
import Router (router)

main :: ServerM
main = serve 8080 router (log "Server running on http://localhost:8080")
