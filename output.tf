# Module      : ACM CERTIFICATE
# Description : This terraform module is used for requesting or importing SSL/TLS #               certificate with validation.

output "id" {
  value = concat(
    var.import_certificate ? aws_acm_certificate.import-cert.*.id : aws_acm_certificate.cert.*.id
  )[0]
  description = "The ID of the Certificate."
}

output "arn" {
  value = concat(
    var.import_certificate ? aws_acm_certificate.import-cert.*.arn : aws_acm_certificate.cert.*.arn
  )[0]
  description = "The ARN of the Certificate."
}

output "domain_validation_options" {
  value = concat(
    var.import_certificate ? aws_acm_certificate.import-cert.*.domain_validation_options : aws_acm_certificate.cert.*.domain_validation_options
  )[0]
  description = "The domain validation option of the Certificate."
}

output "tags" {
  value       = module.labels.tags
  description = "A mapping of tags to assign to the resource."
}