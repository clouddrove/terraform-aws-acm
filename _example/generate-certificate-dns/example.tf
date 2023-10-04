provider "aws" {
  region = "eu-west-1"
}

##-----------------------------------------------------------------------------
## acm Module call with DNS.
##-----------------------------------------------------------------------------
module "acm" {
  source = "./../../"

  name        = "certificate"
  environment = "test"

  domain_name               = "clouddrove.com"
  subject_alternative_names = ["*.${var.domain}", "www.${var.domain}"]
}
