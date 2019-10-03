provider "aws" {
  region = "eu-west-1"
}

module "acm" {
  source = "git::https://github.com/clouddrove/terraform-aws-acm.git?ref=tags/0.12.2"

  name        = "certificate"
  application = "clouddrove"
  environment = "test"
  label_order = ["environment", "name", "application"]

  private_key        = "./../../../clouddrove-private-key.pem"
  certificate_body   = "./../../../clouddrove-cert.pem"
  certificate_chain  = "./../../../clouddrove-chain.crt"
  import_certificate = true
}

