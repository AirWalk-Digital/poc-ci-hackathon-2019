provider "aws" {
  region  = var.region
  version = ">= 2.36.0"
}


module "poc-ci" {
  source = "../../module"
}
