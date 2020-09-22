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
                   { "route": "app.host.tld" },
                   { "route": "app.host.tld:1234" },
                   { "route": "app.host.tld/path"}
                ]
            }
        ]
    } 
    no_violations with input as input
    no_warnings with input as input
}

test_route_structure {
    input := {
        "applications": [
            {
                "name": "application",
                "routes": [
                    "app.host.tld"
                ]
            }
        ]
    }
    deny["Entries in the route array must have a route attribute"] with input as input
}

test_warn_no_route_override {
    input := {
        "applications": [
            {
                "name": "application",
                "routes": { "route": "app.domain.tld" },
                "no-route": true
            }
        ]
    }    
    warn["Specifying no-route will override all other routing attributes"] with input as input 
}

test_warn_no_route_override {
    input := {
        "applications": [
            {
                "name": "application",
                "domain": "domain.tld",
                "no-route": true
            }
        ]
    }    
    warn["Specifying no-route will override all other routing attributes"] with input as input 
}

test_warn_no_route_override {
    input := {
        "applications": [
            {
                "name": "application",
                "domains": [ "domain.tld", "another.tld" ],
                "no-route": true
            }
        ]
    }    
    warn["Specifying no-route will override all other routing attributes"] with input as input 
}

test_warn_no_route_override {
    input := {
        "applications": [
            {
                "name": "application",
                "host": "app",
                "no-route": true
            }
        ]
    }    
    warn["Specifying no-route will override all other routing attributes"] with input as input 
}

test_warn_no_route_override {
    input := {
        "applications": [
            {
                "name": "application",
                "hosts": [
                    "app",
                    "another"
                ],
                "no-route": true
            }
        ]
    }    
    warn["Specifying no-route will override all other routing attributes"] with input as input 
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
                "host": "app"
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
                    "app",
                    "another"
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
