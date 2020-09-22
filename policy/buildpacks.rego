package main

warn[msg] {
    input.applications[app].buildpack
    msg := "The buildpack field has been deprecated. Buildpacks should be specified in the buildpacks array."  
}

deny[msg] {
    input.applications[app].buildpack
    input.applications[app].buildpacks
    msg := "The buildpack field has been deprecated and cannot be used with the buildpacks array"
}

deny[msg] {
    not count(input.applications[app].buildpacks) > 0
    msg := "You must specify at least one buildpack in the buildpacks entry"
}

deny[msg] {
    input.applications[app].buildpacks[pack] == ""
    msg := "Entries in the buildpack array cannot be empty"
}

deny[msg] {
    input.applications[app].buildpack == ""
    msg := "You must specify a buildpack in the buildpack entry"
}

warn[msg] {
    startswith(input.applications[app].buildpack, "http://")
    msg := "Remote buildpacks may introduce untrusted code into your environment"
}

warn[msg] {
    startswith(input.applications[app].buildpack, "https://")
    msg := "Remote buildpacks may introduce untrusted code into your environment"
}

warn[msg] {
    startswith(input.applications[app].buildpacks[pack], "http://")
    msg := "Remote buildpacks may introduce untrusted code into your environment"
}

warn[msg] {
    startswith(input.applications[app].buildpacks[pack], "https://")
    msg := "Remote buildpacks may introduce untrusted code into your environment"
}

deny[msg] {
    count(input.applications[app].buildpacks) > 1
    input.applications[app].domain
    msg := "Multiple buildpacks cannot be used with deprecated routing attributes"
}

deny[msg] {
    count(input.applications[app].buildpacks) > 1
    input.applications[app].domains
    msg := "Multiple buildpacks cannot be used with deprecated routing attributes"
}

deny[msg] {
    count(input.applications[app].buildpacks) > 1
    input.applications[app].host
    msg := "Multiple buildpacks cannot be used with deprecated routing attributes"
}

deny[msg] {
    count(input.applications[app].buildpacks) > 1
    input.applications[app].hosts
    msg := "Multiple buildpacks cannot be used with deprecated routing attributes"
}

deny[msg] {
    count(input.applications[app].buildpacks) > 1
    input.applications[app]["no-hostname"]
    msg := "Multiple buildpacks cannot be used with deprecated routing attributes"
}
