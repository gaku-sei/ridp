{ name =
    "reccoo-idp"
, dependencies =
    [ "console"
    , "effect"
    , "psci-support"
    , "httpure"
    , "generics-rep"
    , "foreign-generic"
    ]
, packages =
    ./packages.dhall
, sources =
    [ "src/**/*.purs", "test/**/*.purs" ]
}
