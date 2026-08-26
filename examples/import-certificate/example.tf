provider "aws" {
  region = "eu-west-1"
}

##-----------------------------------------------------------------------------
## acm Module call with import certificate.
##-----------------------------------------------------------------------------
module "acm" {
  source = "./../../"

  name        = "certificate-test"
  environment = "test"

  private_key       = "${path.module}/clouddrove-private-key.pem"
  certificate_body  = "${path.module}/clouddrove-cert.pem"
  certificate_chain = "${path.module}/clouddrove-chain.crt"
}
