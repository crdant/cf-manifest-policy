package main

test_uses_docker_image {
    input := { 
        "applications": [
            {
                "name": "application",
                "docker": {
                    "image": "cloudfoundry/test-app"
                }
            }
        ]
    } 
    no_violations with input as input
    no_warnings with input as input
}

test_no_docker_and_buildpacks {
    input := { 
        "applications": [
            {
                "name": "application",
                "docker": {
                    "image": "cloudfoundry/test-app"
                },
                "buildpack": "buildpack"
            }
        ]
    }
    deny["You cannot specify buildpack(s) when pushing a docker image"] with input as input
}

test_no_docker_and_buildpacks {
    input := { 
        "applications": [
            {
                "name": "application",
                "docker": {
                    "image": "cloudfoundry/test-app"
                },
                "buildpacks": [ "buildpack" ]
            }
        ]
    }
    deny["You cannot specify buildpack(s) when pushing a docker image"] with input as input
}

test_uses_private_docker_image {
    input := { 
        "applications": [
            {
                "name": "application",
                "docker": {
                    "image": "cloudfoundry/test-app",
                    "username": "crdant"
                },
                "env": {
                    "CF_DOCKER_PASSWORD": "hunter2"
                }
            }
        ]
    } 
    no_violations with input as input
    no_warnings with input as input
}

test_docker_auth_is_complete {
    input := { 
        "applications": [
            {
                "name": "application",
                "docker": {
                    "image": "cloudfoundry/test-app",
                    "username": "crdant"
                },
            }
        ]
    }
    deny["If you provide a username for the docker image, the password must be provided in the environment variable CF_DOCKER_PASSWORD"] with input as input
}

test_docker_auth_is_complete {
    input := { 
        "applications": [
            {
                "name": "foo",
                "docker": {
                    "image": "cloudfoundry/test-app",
                },
                "env": {
                    "CF_DOCKER_PASSWORD": "hunter2"
                }
            }
        ]
    }
    warn["You set CF_DOCKER_PASSWORD for application foo but not a docker username"] with input as input
}
