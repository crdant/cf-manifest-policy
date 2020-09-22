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

test_warn_deprecated_domains {
    input := { 
        "applications": [
            {
                "name": "application",
                "domains": [
                    "host.tld"
                ]
            }
        ]
    } 
    warn["The component attributes for specifying routes have been deprecated. Use the routes array instead."] with input as input
}

test_warn_deprecated_host {
    input := { 
        "applications": [
            {
                "name": "application",
                "host": "app.host.tld"
            }
        ]
    } 
    warn["The component attributes for specifying routes have been deprecated. Use the routes array instead."] with input as input
}

test_warn_deprecated_hosts {
    input := { 
        "applications": [
            {
                "name": "application",
                "hosts": [
                    "app.host.tld"
                ],
            }
        ]
    } 
    warn["The component attributes for specifying routes have been deprecated. Use the routes array instead."] with input as input
}

test_warn_deprecated_hosts {
    input := { 
        "applications": [
            {
                "name": "application",
                "no-hostname": true
            }
        ]
    } 
    warn["The component attributes for specifying routes have been deprecated. Use the routes array instead."] with input as input
}

test_no_routes_with_deprecated_component_attributes {
    input := {
        "applications": [
            {
                "name": "application",
                "routes": [
                   { "route": "app.host.tld" }
                ],
                "domain": "host.tld"
            }
        ]
    }
    deny["Routes array cannot be used with deprecated routing attributes"] with input as input
}

test_no_routes_with_deprecated_component_attributes {
    input := {
        "applications": [
            {
                "name": "application",
                "routes": [
                   { "route": "app.host.tld" }
                ],
                "domains": [
                    "host.tld"
                ]
            }
        ]
    }
    deny["Routes array cannot be used with deprecated routing attributes"] with input as input
}

test_no_routes_with_deprecated_component_attributes {
    input := {
        "applications": [
            {
                "name": "application",
                "routes": [
                   { "route": "app.host.tld" }
                ],
                "host": "app.host.tld" 
            }
        ]
    }
    deny["Routes array cannot be used with deprecated routing attributes"] with input as input
}

test_no_routes_with_deprecated_component_attributes {
    input := {
        "applications": [
            {
                "name": "application",
                "routes": [
                   { "route": "app.host.tld" }
                ],
                "hosts": [
                    "app.host.tld" 
                ],
            }
        ]
    }
    deny["Routes array cannot be used with deprecated routing attributes"] with input as input
}
