provider "aws" {
  region = "us-east-1"
}

##-----------------------------------------------------------------------------
## ACM Module call with AWS Private CA and Subdomain Zone Lookup.
##-----------------------------------------------------------------------------
module "acm" {
  source = "./../../"

  name        = "private-certificate"
  environment = "test"

  enable_aws_certificate    = true
  enable_dns_validation     = false
  domain_name               = "internal.api.clouddrove.com"
  certificate_authority_arn = "arn:aws:acm-pca:us-east-1:123456789012:certificate-authority/12345678-1234-1234-1234-123456789012"

  certificate_transparency_logging_preference = "DISABLED"
}
