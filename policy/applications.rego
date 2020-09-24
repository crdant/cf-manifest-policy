package main

deny[msg] {
    not input.applications
    msg = "Manifest must include at least one application to deploy"
}

deny[msg] {
    some app
    some other
    input.applications[app].name == input.applications[other].name
    not app == other
    msg = "Applications must have unique names"
}

warn[msg] {
    some app
    input.applications[app].instances == 1
    msg = "To ensure that platform maintenance does not interrupt your app, run at least two instances."
}

deny[msg] {
    some app
    input.applications[app].instances == 0
    msg = sprintf("There will be no running instances of application %v", [ input.applications[app].name ])
}

deny[msg] {
    some app
    input.applications[app]["health-check-type"] == "none"
    msg = "Health check type none has been removed in the latest Cloud Foundry CLI"
}

deny[msg] {
    has_health_check_type
    not has_valid_health_check
    msg = "Health check type must be port, process, or http"
}

has_health_check_type {
    input.applications[app]["health-check-type"]
}    

has_valid_health_check {
    health_check_types := [ "process", "port", "http" ]
    
    some app
    some type
    health_check_types[type] == input.applications[app]["health-check-type"]
}

warn[msg] {
    some app
    input.applications[app]["no-route"]
    not input.applications[app]["health-check-type"]
    
    msg = sprintf("If application %v does not listen on a port, Diego will mark it as crashed.", [ input.applications[app].name ])
}

warn[msg] {
    some app
    input.applications[app]["no-route"]
    not input.applications[app]["health-check-type"] == "process"
    
    msg = sprintf("If application %v does not listen on a port, Diego will mark it as crashed.", [ input.applications[app].name ])
}
