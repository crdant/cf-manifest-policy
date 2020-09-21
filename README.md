# Cloud Foundry Manifest Policy Examples

A set of [OPA](https://openpolicyagent.org/) policies to validate 
[Cloud Foundry](https://cloudfoundry.org) or [Tanzu Application
Service](https://tanzu.vmware.com/application-service) deployment
manifests using [Conftest](https://conftest.dev).

Policies help you avoid obvious errors, e.g. no applications
defined, and enforce best practices like running more than one 
instance. They can be used to validate your manifests during 
development or as part of your CI/CD pipeline.

