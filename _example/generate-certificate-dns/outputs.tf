output "arn" {
  value       = module.acm[*].arn
  description = "The ARN of the certificate"
}

output "tags" {
  value       = module.acm.tags
  description = "A mapping of tags to assign to the certificate."
}

output "acm_certificate_domain_validation_options" {
  value       = module.acm.acm_certificate_domain_validation_options
  description = "A list of attributes to feed into other resources to complete certificate validation. Can have more than one element, e.g. if SANs are defined. Only set if DNS-validation was used."
}

output "acm_certificate_status" {
  value       = module.acm.acm_certificate_status
  description = "Status of the certificate."
}

output "validation_route53_record_fqdns" {
  value       = module.acm.validation_route53_record_fqdns
  description = "List of FQDNs built using the zone domain and name."
}