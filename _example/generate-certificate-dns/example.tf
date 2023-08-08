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
  label_order = ["name", "environment"]

  enable_aws_certificate    = true
  domain_name               = "clouddrove.com"
  subject_alternative_names = ["www.clouddrove.com"]
  validation_method         = "DNS"
  enable_dns_validation     = false
}
