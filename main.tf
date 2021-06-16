## Managed By : CloudDrove
## Description : This Script is used to create ACM Certificate and Route53 Validation.
## Copyright @ CloudDrove. All Right Reserved.

#Module      : label
#Description : This terraform module is designed to generate consistent label names and tags
#              for resources. You can use terraform-labels to implement a strict naming
#              convention.
module "labels" {
  source  = "clouddrove/labels/aws"
  version = "0.15.0"

  name        = var.name
  environment = var.environment
  managedby   = var.managedby
  label_order = var.label_order
}


# Module      : ACM CERTIFICATE
# Description : This terraform module is used for requesting or importing SSL/TLS
#               certificate with validation.
resource "aws_acm_certificate" "import-cert" {
  count = var.enable_acm_certificate && var.import_certificate ? 1 : 0

  private_key       = file(var.private_key)
  certificate_body  = file(var.certificate_body)
  certificate_chain = file(var.certificate_chain)
  tags              = module.labels.tags
  lifecycle {
    create_before_destroy = true
  }
}

# Module      : ACM CERTIFICATE
# Description : This terraform module is used for requesting or importing SSL/TLS
#               certificate with validation.
resource "aws_acm_certificate" "cert" {
  count = var.enable_acm_certificate && var.enable_aws_certificate ? 1 : 0

  domain_name               = var.domain_name
  validation_method         = var.validation_method
  subject_alternative_names = var.subject_alternative_names
  tags                      = module.labels.tags
  lifecycle {
    create_before_destroy = true
  }
}

# Module      : ACM CERTIFICATE VALIDATION
# Description : Terraform module which validates ACM Certificate via email resource on AWS
resource "aws_acm_certificate_validation" "cert" {
  count           = var.validate_certificate ? 1 : 0
  certificate_arn = join("", aws_acm_certificate.cert.*.arn)
}

# Module      : ACM CERTIFICATE DNS VALIDATION
# Description : Terraform module which create Router53 Recore for DNS validation
data "aws_route53_zone" "default" {
  count = var.enable_dns_validation ? 1 : 0

  name         = var.domain_name
  private_zone = false
}

resource "aws_route53_record" "default" {
  count = var.enable_dns_validation ? 1 : 0

  zone_id         = join("", data.aws_route53_zone.default.*.zone_id)
  ttl             = var.ttl
  allow_overwrite = true
  name            = join("", aws_acm_certificate.cert[0].domain_validation_options.*.resource_record_name)
  type            = join("", aws_acm_certificate.cert[0].domain_validation_options.*.resource_record_type)
  records         = [join("", aws_acm_certificate.cert[0].domain_validation_options.*.resource_record_value)]
}

# Module      : ACM  CERTIFICATE VALIDATION
# Description : Terraform module which validates ACM Certificate via DNS resource on AWS
resource "aws_acm_certificate_validation" "default" {
  count = var.enable_dns_validation ? 1 : 0

  certificate_arn         = join("", aws_acm_certificate.cert.*.arn)
  validation_record_fqdns = aws_route53_record.default.*.fqdn
}
