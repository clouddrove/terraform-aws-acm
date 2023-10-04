provider "aws" {
  region = "eu-west-1"
}

locals {
  domain = "clouddrove.com"
}

##-----------------------------------------------------------------------------
## acm Module call with DNS.
##-----------------------------------------------------------------------------
module "acm" {
  source = "./../../"

  name        = "certificate"
  environment = "test"

  domain_name               = "clouddrove.com"
  subject_alternative_names = ["*.${local.domain}", "www.${local.domain}"]
}
