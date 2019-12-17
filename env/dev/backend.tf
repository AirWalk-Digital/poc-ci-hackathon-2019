terraform {
  required_version = ">= 0.12"
  backend "s3" {
    bucket  = "358494172528-eu-west-1-tfstate"
    key     = "dev/poc-ci.tfstate"
    region  = "eu-west-1"
    encrypt = "true"
  }
}

