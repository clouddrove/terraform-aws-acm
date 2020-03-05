provider "aws" {
  region = "eu-west-1"
}

module "acm" {
  source = "./../../"

  name        = "certificate"
  application = "clouddrove"
  environment = "test"
  label_order = ["environment", "application", "name"]

  domain_name            = "clouddrove.com"
  validation_method      = "EMAIL"
  validate_certificate   = false
  enable_aws_certificate = true
}

