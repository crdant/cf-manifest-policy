package main

has_invalid_route_structure[app] {
    some app
    some r
    route := input.applications[app].routes[r]
    not route.route
}

deny[msg] {
    some app
    has_route_array[app]
    has_invalid_route_structure[app]
    msg := "Entries in the route array must have a route attribute"
}

deny[msg] {
    some app
    has_route_array[app]
    has_empty_routes[app]
    msg := "Entries in the route array must specify a non-empty route"
}

has_empty_routes[app]{
    some app
    some r
    route := input.applications[app].routes[r]
    route.route == ""
}

deny[msg] {
    some app
    has_route_array[app]
    has_name_without_domain[app]
    msg := "Entries in the route array must include a DNS domain"
}

has_name_without_domain[app] {
    some app
    some r
    route := input.applications[app].routes[r]
    not contains(route.route, ".")
}

deny[msg] {
    some app
    has_route_array[app]
    has_tcp_route[app] 
    has_invalid_tcp_route[app] 
    msg := "The port in a TCP route must be a number"
}

has_tcp_route[app] {
    some app
    some r
    route := input.applications[app].routes[r].route
    count(split(route,":")) == 2
}

has_invalid_tcp_route[app] {
    some app
    some r
    route := input.applications[app].routes[r].route
    contains(route,":")
    not regex.match("[a-zA-Z.-]:\\d+", route) 
}

warn[msg] {
    some app
    has_no_route[app] 
    has_route_array[app]
    msg := "Specifying no-route will override all other routing attributes"
}

has_no_route[app] {
    input.applications[app]["no-route"]
}

has_route_array[app] {
    input.applications[app].routes
}

warn[msg] {
    some app
    has_random_route[app]
    has_route_array[app]
    msg := "Random route will not be generated if routes are specified"
}

has_random_route[app] {
    input.applications[app]["random-route"]
}

warn[msg] {
    has_domain[app]
    msg := "The component attributes for specifying routes have been deprecated. Use the routes array instead."
}

warn[msg] {
    some app
    has_no_route[app]
    has_domain[app]
    msg := "Specifying no-route will override all other routing attributes"
}

has_domain[app] {
    input.applications[app].domain
}

warn[msg] {
    has_domains[app]
    msg := "The component attributes for specifying routes have been deprecated. Use the routes array instead."
}

warn[msg] {
    some app
    has_no_route[app]
    has_domains[app]
    msg := "Specifying no-route will override all other routing attributes"
}

has_domains[app] {
    input.applications[app].domains
}

warn[msg] {
    has_host[app]
    msg := "The component attributes for specifying routes have been deprecated. Use the routes array instead."
}

warn[msg] {
    some app
    has_no_route[app]
    has_host[app]
    msg := "Specifying no-route will override all other routing attributes"
}

warn[msg] {
    some app
    has_random_route[app]
    has_host[app]
    msg := "Random route will not be generated if routes are specified"
}

has_host[app] {
    input.applications[app].host
}

warn[msg] {
    has_hosts[app]
    msg := "The component attributes for specifying routes have been deprecated. Use the routes array instead."
}

warn[msg] {
    some app
    has_no_route[app]
    has_hosts[app]
    msg := "Specifying no-route will override all other routing attributes"
}

warn[msg] {
    some app
    has_random_route[app]
    has_hosts[app]
    msg := "Random route will not be generated if routes are specified"
}

has_hosts[app] {
    input.applications[app].hosts
}

warn[msg] {
    input.applications[app]["no-hostname"]
    msg := "The component attributes for specifying routes have been deprecated. Use the routes array instead."
}

deny[msg] {
    some app
    has_route_array[app]
    has_domain[app]
    msg := "Routes array cannot be used with deprecated routing attributes"
}

deny[msg] {
    some app
    has_route_array[app]
    has_domains[app]
    msg := "Routes array cannot be used with deprecated routing attributes"
}

deny[msg] {
    some app
    has_route_array[app]
    has_host[app]
    msg := "Routes array cannot be used with deprecated routing attributes"
}

deny[msg] {
    some app
    has_route_array[app]
    has_hosts[app]
    msg := "Routes array cannot be used with deprecated routing attributes"
}
