provider "aws" {
  region = "eu-west-1"
}

module "acm" {
  source = "./../../"

  name        = "certificate"
  environment = "test"
  label_order = ["name", "environment"]

  private_key        = "./../../../clouddrove-private-key.pem"
  certificate_body   = "./../../../clouddrove-cert.pem"
  certificate_chain  = "./../../../clouddrove-chain.crt"
  import_certificate = true
}
