provider "aws" {
  region = "eu-west-1"
}

module "acm" {
  source = "git::https://github.com/clouddrove/terraform-aws-acm.git?ref=tags/0.12.2"

  name        = "certificate"
  application = "clouddrove"
  environment = "test"
  label_order = ["environment", "name", "application"]

  domain_name           = "clouddrove.com"
  validation_method     = "DNS"
  enable_dns_validation = false
}

