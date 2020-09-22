package main

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
