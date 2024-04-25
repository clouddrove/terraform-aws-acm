output "arn" {
  value       = module.acm[*].arn
  description = "The ARN of the certificate"
}

output "tags" {
  value       = module.acm.tags
  description = "A mapping of tags to assign to the certificate."
}
