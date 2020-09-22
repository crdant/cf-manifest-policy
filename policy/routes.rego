package main

warn[msg] {
    input.applications[app].domain
    msg := "The component attributes for specifying routes have been deprecated. Use the routes array instead."
}
