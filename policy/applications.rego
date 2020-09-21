package main

deny[msg] {
    not input.applications
    msg = "Manifest must include at least one application to deploy"
}
