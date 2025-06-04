provider "aws" {
  region = "us-east-1"
}

locals {
  domain = "ld.clouddrove.ca"
}

##-----------------------------------------------------------------------------
## acm Module call with DNS.
##-----------------------------------------------------------------------------
module "acm" {
  source = "./../../"

  name                         = "certificate"
  environment                  = "test"
  enable_dns_validation        = true
  domain_name                  = "ld.clouddrove.ca"
  subject_alternative_names    = ["www.${local.domain}", "*.${local.domain}"]
  key_algorithm                = "RSA_2048"
  transparency_logging_enabled = false
}