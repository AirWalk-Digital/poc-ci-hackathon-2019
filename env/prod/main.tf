provider "aws" {
  region  = var.region
  version = ">= 2.36.0"
}


module "poc-ci" {
  source = "../../module"
  instance_type = var.instance_type
}

output "instance-id" {
  value = module.poc-ci.instance_id
}