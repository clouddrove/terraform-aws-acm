provider "aws" {
  region = "eu-west-1"
}

##-----------------------------------------------------------------------------
## acm Module call with import certificate.
##-----------------------------------------------------------------------------
module "acm" {
  source = "./../../"

  name        = "certificate"
  environment = "test"

  import_certificate = true
  private_key        = "./../../../clouddrove-private-key.pem"
  certificate_body   = "./../../../clouddrove-cert.pem"
  certificate_chain  = "./../../../clouddrove-chain.crt"
}
