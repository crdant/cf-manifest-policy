package main

valid_route_array_structure {
    some app
    some r
    route := input.applications[app].routes[r]
    route.route
}

deny[msg] {
    has_route_array
    not valid_route_array_structure
    msg := "Entries in the route array must have a route attribute"
}

warn[msg] {
    has_no_route
    has_route_array
    msg := "Specifying no-route will override all other routing attributes"
}

has_no_route {
    input.applications[app]["no-route"]
}

has_route_array {
    input.applications[app].routes
}

warn[msg] {
    has_random_route
    has_route_array
    msg := "Random route will not be generated if routes are specified"
}

has_random_route {
    input.applications[app]["random-route"]
}

warn[msg] {
    has_domain
    msg := "The component attributes for specifying routes have been deprecated. Use the routes array instead."
}

warn[msg] {
    has_no_route
    has_domain
    msg := "Specifying no-route will override all other routing attributes"
}

has_domain {
    input.applications[app].domain
}

warn[msg] {
    has_domains
    msg := "The component attributes for specifying routes have been deprecated. Use the routes array instead."
}

warn[msg] {
    has_no_route
    has_domains
    msg := "Specifying no-route will override all other routing attributes"
}

has_domains {
    input.applications[app].domains
}

warn[msg] {
    has_host
    msg := "The component attributes for specifying routes have been deprecated. Use the routes array instead."
}

warn[msg] {
    has_no_route
    has_host
    msg := "Specifying no-route will override all other routing attributes"
}

warn[msg] {
    has_random_route
    has_host
    msg := "Random route will not be generated if routes are specified"
}

has_host {
    input.applications[app].host
}

warn[msg] {
    has_hosts
    msg := "The component attributes for specifying routes have been deprecated. Use the routes array instead."
}

warn[msg] {
    has_no_route
    has_hosts
    msg := "Specifying no-route will override all other routing attributes"
}

warn[msg] {
    has_random_route
    has_hosts
    msg := "Random route will not be generated if routes are specified"
}

has_hosts {
    input.applications[app].hosts
}

warn[msg] {
    input.applications[app]["no-hostname"]
    msg := "The component attributes for specifying routes have been deprecated. Use the routes array instead."
}

deny[msg] {
    has_route_array
    has_domain
    msg := "Routes array cannot be used with deprecated routing attributes"
}

deny[msg] {
    has_route_array
    has_domains
    msg := "Routes array cannot be used with deprecated routing attributes"
}

deny[msg] {
    has_route_array
    has_host
    msg := "Routes array cannot be used with deprecated routing attributes"
}

deny[msg] {
    has_route_array
    has_hosts
    msg := "Routes array cannot be used with deprecated routing attributes"
}
