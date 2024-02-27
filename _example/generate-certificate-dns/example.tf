provider "aws" {
  region = "us-east-1"
}

locals {
  domain = "clouddrove.ca"
}

##-----------------------------------------------------------------------------
## acm Module call with DNS.
##-----------------------------------------------------------------------------
module "acm" {
  source = "./../../"

  name                      = "certificate"
  environment               = "test"
  domain_name               = "clouddrove.ca"
  subject_alternative_names = ["www.${local.domain}", "*.${local.domain}"]
}
