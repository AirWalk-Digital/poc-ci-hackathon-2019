                           package tags_validation

minimum_tags = {"Namee"}
instance_types = {"t2.nanoi"}

tags_contain_proper_keys(tags) {
    keys := {key | tags[key]}
    leftover := minimum_tags - keys
    leftover == set()
}

valid_instance_type(type){
   type == "t2.nano"
}
