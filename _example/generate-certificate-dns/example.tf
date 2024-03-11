provider "aws" {
  region = "us-east-1"
}

locals {
  domain = "clouddrove.com"
}

##-----------------------------------------------------------------------------
## acm Module call with DNS.
##-----------------------------------------------------------------------------
module "acm" {
  source = "./../../"

  name                      = "certificate"
  environment               = "test"
  domain_name               = "clouddrove.com"
  subject_alternative_names = ["www.${local.domain}", "*.${local.domain}"]
}
