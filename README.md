# poc-ci-hackathon-2019

## Overview
PoC a SaaS CI with GitHub & CircleCi workflows.
A sample Terraform repo supporting 2 environments (dev and prod) will be used to test a CircleCi pipeline / workflow.
<hr>

## Workflow implemented
 - GitHub integration: commit(s) on master branch will trigger a CircleCi workflow
 - Automatic destroy of dev Terraform resources after provisioning and time delay, e.g. 10 mins
 - [Validation tests](https://github.com/instrumenta/conftest/) using Open Policy Agent
 - Prod provisioning conditional on commit(s) being tagged. e.g. v0.1.5. Untagged commits will only run a dev provisioning
 - Post deployment check (python) using output from terraform apply (e.g. instance id)
 - Manual approval before prod provisioning
