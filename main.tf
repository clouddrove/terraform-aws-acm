##----------------------------------------------------------------------------------
## Labels module callled that will be used for naming and tags.
##----------------------------------------------------------------------------------
module "labels" {
  source      = "clouddrove/labels/aws"
  version     = "1.3.0"
  name        = var.name
  environment = var.environment
  managedby   = var.managedby
  label_order = var.label_order
  repository  = var.repository
}

##----------------------------------------------------------------------------------
## The ACM certificate resource allows requesting and management of certificates from the Amazon Certificate Manager.
##----------------------------------------------------------------------------------
resource "aws_acm_certificate" "import-cert" {
  count = var.enable && var.import_certificate ? 1 : 0

  private_key       = file(var.private_key)
  certificate_body  = file(var.certificate_body)
  certificate_chain = file(var.certificate_chain)
  tags              = module.labels.tags

  dynamic "validation_option" {
    for_each = var.validation_option

    content {
      domain_name       = try(validation_option.value["domain_name"], validation_option.key)
      validation_domain = validation_option.value["validation_domain"]
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

##----------------------------------------------------------------------------------
## The ACM certificate resource allows requesting and management of certificates from the Amazon Certificate Manager.
##----------------------------------------------------------------------------------
resource "aws_acm_certificate" "cert" {
  count = var.enable && var.enable_aws_certificate ? 1 : 0

  domain_name               = var.domain_name
  validation_method         = var.validation_method
  subject_alternative_names = var.subject_alternative_names
  tags                      = module.labels.tags

  dynamic "validation_option" {
    for_each = var.validation_option

    content {
      domain_name       = try(validation_option.value["domain_name"], validation_option.key)
      validation_domain = validation_option.value["validation_domain"]
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

##----------------------------------------------------------------------------------
## Most commonly, this resource is used together with aws_route53_record and aws_acm_certificate to request a DNS validated certificate, deploy the required validation records and wait for validation to complete.
##----------------------------------------------------------------------------------
resource "aws_acm_certificate_validation" "cert" {
  count                   = var.enable && var.validate_certificate ? 1 : 0
  certificate_arn         = join("", aws_acm_certificate.cert[*].arn)
  validation_record_fqdns = flatten([aws_route53_record.default[*].fqdn, var.validation_record_fqdns])

}

##----------------------------------------------------------------------------------
## A hosted zone is analogous to a traditional DNS zone file; it represents a collection of records that can be managed together, belonging to a single parent domain name.
##----------------------------------------------------------------------------------
data "aws_route53_zone" "default" {
  count        = var.enable && var.enable_dns_validation ? 1 : 0
  name         = var.domain_name
  private_zone = var.private_zone
}

##----------------------------------------------------------------------------------
## A Route 53 record contains authoritative DNS information for a specified DNS name. DNS records are most commonly used to map a name to an IP Address..
##----------------------------------------------------------------------------------
resource "aws_route53_record" "default" {
  for_each = {
    for record in aws_acm_certificate.cert[0].domain_validation_options[*] : record.domain_name => {
      name   = record.resource_record_name
      record = record.resource_record_value
      type   = record.resource_record_type
    }
  }

  allow_overwrite = var.allow_overwrite
  name            = each.value.name
  records         = [each.value.record]
  ttl             = var.ttl
  type            = each.value.type
  zone_id         = data.aws_route53_zone.default[0].zone_id
}

##----------------------------------------------------------------------------------
## Most commonly, this resource is used together with aws_route53_record and aws_acm_certificate to request a DNS validated certificate, deploy the required validation records and wait for validation to complete.
##----------------------------------------------------------------------------------
resource "aws_acm_certificate_validation" "default" {
  count                   = var.enable && var.enable_dns_validation ? 1 : 0
  certificate_arn         = aws_acm_certificate.cert[0].arn
  validation_record_fqdns = [for record in aws_route53_record.default : record.fqdn]
}


