provider "aws" {
  region = "eu-west-1"
}

module "acm" {
  source = "./../../"

  name        = "certificate"
  application = "clouddrove"
  environment = "test"
  label_order = ["environment", "application", "name"]

  private_key        = "./../../../clouddrove-private-key.pem"
  certificate_body   = "./../../../clouddrove-cert.pem"
  certificate_chain  = "./../../../clouddrove-chain.crt"
  import_certificate = true
}

