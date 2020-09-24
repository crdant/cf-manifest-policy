package main

test_minimal_manifest{
  input := {
    "applications": [
      { 
        "name": "application"
      }
    ]
  }
  no_violations with input as input
}

test_manifest_with_no_applications {
  deny["Manifest must include at least one application to deploy"] with input as {}
}

test_warn_with_only_one_interface {
  input := {
    "applications": [
      { 
        "name": "application",
        "instances": 1
      }
    ]
  }
  warn["To ensure that platform maintenance does not interrupt your app, run at least two instances."] with input as input
}
