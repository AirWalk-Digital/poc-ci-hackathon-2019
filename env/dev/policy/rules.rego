package main

import data.tags_validation

module_address[i] = address {
    changeset := input.resource_changes[i]
    address := changeset.address
}

tags_contain_minimum_set[i] = resources {
    changeset := input.resource_changes[i]
    tags := changeset.change.after.tags
    resources := [resource | resource := module_address[i]; not tags_validation.tags_contain_proper_keys(changeset.change.after.tags)]
}

valid_instance_type[i] = resources{
    changeset := input.resource_changes[i]
    type := changeset.change.after.instance_type
    resources := [resource | resource := module_address[i]; not tags_validation.valid_instance_type(changeset.change.after.instance_type)]
}


deny[msg] {
    resources := tags_contain_minimum_set[_]
    resources != []
    msg := sprintf("Invalid tags (missing minimum required tags) for the following resources: %v", [resources])
}

deny[msg] {
  resources := valid_instance_type[_]
  resources != []
  msg := sprintf("Invalid instance type for the resource:  %v", [resources])
}
