package main

deny[msg] {
    not input.applications
    msg = "Manifest must include at least one application to deploy"
}

warn[msg] {
    some app
    input.applications[app].instances == 1
    msg = "To ensure that platform maintenance does not interrupt your app, run at least two instances."
}
