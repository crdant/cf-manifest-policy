package main

test_uses_routes_array {
    input := { 
        "applications": [
            {
                "name": "application",
                "buildpacks": [
                    "buildpack"
                ],
                "routes": [
                   { "route": "app.host.tld" }
                ]
            }
        ]
    } 
    no_violations with input as input
    no_warnings with input as input
}

test_warn_deprecated_domain {
    input := { 
        "applications": [
            {
                "name": "application",
                "domain": "host.tld"
            }
        ]
    } 
    warn["The component attributes for specifying routes have been deprecated. Use the routes array instead."] with input as input
}

