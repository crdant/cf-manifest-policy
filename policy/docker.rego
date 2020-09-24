package main

deny[msg] {
    some app
    input.applications[app].docker
    input.applications[app].buildpack
    msg = "You cannot specify buildpack(s) when pushing a docker image"
}

deny[msg] {
    some app
    input.applications[app].docker
    input.applications[app].buildpacks
    msg = "You cannot specify buildpack(s) when pushing a docker image"
}

deny[msg] {
    some app
    input.applications[app].docker.username
    not input.applications[app].env["CF_DOCKER_PASSWORD"]
    msg = "If you provide a username for the docker image, the password must be provided in the environment variable CF_DOCKER_PASSWORD"
}

warn[msg] {
    some app
    input.applications[app].env["CF_DOCKER_PASSWORD"]
    not input.applications[app].docker.username
    
    msg = "You set CF_DOCKER_PASSWORD for application foo but not a docker username"
}
