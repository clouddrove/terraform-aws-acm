provider "aws" {
  region = "eu-west-1"
}

##-----------------------------------------------------------------------------
## acm Module call with EMAIL.
##-----------------------------------------------------------------------------
module "acm" {
  source = "./../../"

  name        = "certificate"
  environment = "test"

  validate_certificate      = false
  domain_name               = "clouddrove.com"
  subject_alternative_names = ["www.clouddrove.com"]
  validation_method         = "EMAIL"
}
