variable "domain_name" {
  type        = "string"
  description = "A domain name for which the certificate should be issued"
  default     = ""
}

variable "validation_method" {
  type        = "string"
  default     = ""
  description = "Which method to use for validation, DNS or EMAIL"
}

variable "create_acm_certificate" {
  description = "Do you want to create sub domain ? "
  default     = true
}
