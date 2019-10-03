# Module      : ACM CERTIFICATE
# Description : This terraform module is used for requesting or importing SSL/TLS #               certificate with validation.

output "id" {
  value       = var.import_certificate ? join("", aws_acm_certificate.import-cert.*.id) : join("", aws_acm_certificate.cert.*.id)
  description = "The ID of the Certificate."
}

output "arn" {
  value       = var.import_certificate ? join("", aws_acm_certificate.import-cert.*.arn) : join("", aws_acm_certificate.cert.*.arn)
  description = "The ARN of the Certificate."
}

output "domain_validation_options" {
  value       = var.import_certificate ? join("", aws_acm_certificate.import-cert.*.domain_validation_options) : join("", aws_acm_certificate.cert.*.domain_validation_options)
  description = "The domain validation option of the Certificate."
}

output "tags" {
  value       = module.labels.tags
  description = "A mapping of tags to assign to the resource."
}
