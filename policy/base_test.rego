package main

empty(value) {
  count(value) == 0
}

no_violations {
  empty(deny)
}

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
