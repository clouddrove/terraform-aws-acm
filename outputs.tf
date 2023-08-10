# Module      : ACM CERTIFICATE
# Description : Terraform ACM Certificate module outputs.

output "id" {
  value       = var.import_certificate ? join("", aws_acm_certificate.import-cert[*].id) : join("", aws_acm_certificate.cert[*].id)
  description = "The ID of the Certificate."
}

output "arn" {
  value       = var.import_certificate ? join("", aws_acm_certificate.import-cert[*].arn) : join("", aws_acm_certificate.cert[*].arn)
  description = "The ARN of the Certificate."
}

output "tags" {
  value       = module.labels.tags
  description = "A mapping of tags to assign to the resource."
}

output "acm_certificate_domain_validation_options" {
  value       = flatten(aws_acm_certificate.cert[*].domain_validation_options)
  description = "A list of attributes to feed into other resources to complete certificate validation. Can have more than one element, e.g. if SANs are defined. Only set if DNS-validation was used."
}

output "acm_certificate_status" {
  value       = try(aws_acm_certificate.cert[*].status, "")
  description = "Status of the certificate."
}

output "validation_route53_record_fqdns" {
  value       = aws_route53_record.default[*].fqdn
  description = "List of FQDNs built using the zone domain and name."
}
