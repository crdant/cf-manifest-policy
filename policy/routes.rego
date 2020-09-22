package main

valid_route_array_structure {
    some app
    some r
    route := input.applications[app].routes[r]
    route.route
}

deny[msg] {
    input.applications[app].routes
    not valid_route_array_structure
    msg := "Entries in the route array must have a route attribute"
}

warn[msg] {
    input.applications[app].domain
    msg := "The component attributes for specifying routes have been deprecated. Use the routes array instead."
}

warn[msg] {
    input.applications[app].domains
    msg := "The component attributes for specifying routes have been deprecated. Use the routes array instead."
}

warn[msg] {
    input.applications[app].host
    msg := "The component attributes for specifying routes have been deprecated. Use the routes array instead."
}

warn[msg] {
    input.applications[app].hosts
    msg := "The component attributes for specifying routes have been deprecated. Use the routes array instead."
}

warn[msg] {
    input.applications[app]["no-hostname"]
    msg := "The component attributes for specifying routes have been deprecated. Use the routes array instead."
}

deny[msg] {
    input.applications[app].routes
    input.applications[app].domain
    msg := "Routes array cannot be used with deprecated routing attributes"
}

deny[msg] {
    input.applications[app].routes
    input.applications[app].domains
    msg := "Routes array cannot be used with deprecated routing attributes"
}

deny[msg] {
    input.applications[app].routes
    input.applications[app].host
    msg := "Routes array cannot be used with deprecated routing attributes"
}

deny[msg] {
    input.applications[app].routes
    input.applications[app].hosts
    msg := "Routes array cannot be used with deprecated routing attributes"
}
