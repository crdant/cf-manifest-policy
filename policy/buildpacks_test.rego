package main

test_uses_buildpack_array {
    input := { 
        "applications": [
            {
                "name": "application",
                "buildpacks": [
                   "buildpack"
                ]
            }
        ]
    } 
    no_violations with input as input
    no_warnings with input as input
}

test_warn_deprecated_buildpack {
    input := {
        "applications": [
            {
                "name": "application",
                "buildpack": "buildpack"
            }
        ]
    }
    warn["The buildpack field has been deprecated. Buildpacks should be specified in the buildpacks array."] with input as input
}

test_no_buildpack_with_buildpacks {
    input := {
        "applications": [
            {
                "name": "application",
                "buildpack": "buildpack",
                "buildpacks": [
                   "buildpack"
                ]
            }
        ]
    }
    deny["The buildpack field has been deprecated and cannot be used with the buildpacks array"] with input as input
}

test_no_empty_buildpack {
    input := {
        "applications": [
            {
                "name": "application",
                "buildpacks": []
            }
        ]
    }
    deny["You must specify at least one buildpack in the buildpacks entry"] with input as input
}

test_no_empty_buildpack {
    input := {
        "applications": [
            {
                "name": "application",
                "buildpacks": [""]
            }
        ]
    }
    deny["Entries in the buildpack array cannot be empty"] with input as input
}

test_no_empty_buildpack {
    input := {
        "applications": [
            {
                "name": "application",
                "buildpack": ""
            }
        ]
    }
    deny["You must specify a buildpack in the buildpack entry"] with input as input
}

test_warn_remote_buildpack {
    input := {
        "applications": [
            {
                "name": "application",
                "buildpack": "http://github.com/evil/bitcoin_miner.git"
            }
        ]
    }
    warn["Remote buildpacks may introduce untrusted code into your environment"] with input as input
}

test_warn_remote_buildpack {
    input := {
        "applications": [
            {
                "name": "application",
                "buildpack": "https://github.com/evil/bitcoin_miner.git"
            }
        ]
    }
    warn["Remote buildpacks may introduce untrusted code into your environment"] with input as input
}

test_warn_remote_buildpack {
    input := {
        "applications": [
            {
                "name": "application",
                "buildpacks": [
                    "http://github.com/evil/bitcoin_miner.git"
                ]
            }
        ]
    }
    warn["Remote buildpacks may introduce untrusted code into your environment"] with input as input
}

test_warn_remote_buildpack {
    input := {
        "applications": [
            {
                "name": "application",
                "buildpack": "https://github.com/evil/bitcoin_miner.git"
            }
        ]
    }
    warn["Remote buildpacks may introduce untrusted code into your environment"] with input as input
}

test_no_multiple_with_deprecated_route_attributes {
    input := {
        "applications": [
            {
                "name": "application",
                "buildpacks": [
                    "buildpack",
                    "another"
                ],
                "domain": "host.tld"
            }
        ]
    }
    deny["Multiple buildpacks cannot be used with deprecated routing attributes"] with input as input
}

test_no_multiple_with_deprecated_route_attributes {
    input := {
        "applications": [
            {
                "name": "application",
                "buildpacks": [
                    "buildpack",
                    "another"
                ],
                "domains": [
                    "host.tld"
                ]
            }
        ]
    }
    deny["Multiple buildpacks cannot be used with deprecated routing attributes"] with input as input
}

test_no_multiple_with_deprecated_route_attributes {
    input := {
        "applications": [
            {
                "name": "application",
                "buildpacks": [
                    "buildpack",
                    "another"
                ],
                "host": "app.host.tld"
            }
        ]
    }
    deny["Multiple buildpacks cannot be used with deprecated routing attributes"] with input as input
}

test_no_multiple_with_deprecated_route_attributes {
    input := {
        "applications": [
            {
                "name": "application",
                "buildpacks": [
                    "buildpack",
                    "another"
                ],
                "hosts": [
                    "app.host.tld"
                ]
            }
        ]
    }
    deny["Multiple buildpacks cannot be used with deprecated routing attributes"] with input as input
}

test_no_multiple_with_deprecated_route_attributes {
    input := {
        "applications": [
            {
                "name": "application",
                "buildpacks": [
                    "buildpack",
                    "another"
                ],
                "no-hostname": true 
            }
        ]
    }
    deny["Multiple buildpacks cannot be used with deprecated routing attributes"] with input as input
}

