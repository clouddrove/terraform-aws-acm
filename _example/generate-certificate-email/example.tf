provider "aws" {
  region = "eu-west-1"
}

module "acm" {
  source = "./../../"

  name        = "certificate"
  environment = "test"
  label_order = ["name", "environment"]

  validate_certificate      = false
  domain_name               = "clouddrove.com"
  subject_alternative_names = ["www.clouddrove.com"]
  validation_method         = "EMAIL"
  enable_aws_certificate    = true
}
