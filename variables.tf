#Module      : LABEL
#Description : Terraform label module variables
variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "repository" {
  type        = string
  default     = "https://github.com/clouddrove/terraform-aws-acm"
  description = "Terraform current module repo"
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "label_order" {
  type        = list(any)
  default     = ["name", "environment"]
  description = "Label order, e.g. `name`,`application`."
}

variable "managedby" {
  type        = string
  default     = "hello@clouddrove.com"
  description = "ManagedBy, eg 'CloudDrove'"
}

# Module      : ACM CERTIFICATE
# Description : Terraform ACM Certificate module variables.
variable "domain_name" {
  type        = string
  default     = ""
  description = "A domain name for which the certificate should be issued."
}

variable "subject_alternative_names" {
  type        = list(any)
  default     = []
  description = "Set of domains that should be SANs in the issued certificate. To remove all elements of a previously configured list, set this value equal to an empty list ([]) or use the terraform taint command to trigger recreation."
}

variable "validation_method" {
  type        = string
  default     = "DNS"
  description = "Which method to use for validation, DNS or EMAIL."
}

variable "enable_dns_validation" {
  type        = bool
  default     = false
  description = "Set to prevent validation of DNS."
}

variable "enable" {
  type        = bool
  default     = true
  description = "Whether or not to enable the entire module or not."
}

variable "private_key" {
  type        = string
  default     = ""
  description = "Path of private key."
}

variable "certificate_body" {
  type        = string
  default     = "~"
  description = "Path of certificate body."
}

variable "certificate_chain" {
  type        = string
  default     = ""
  description = "Path of certificate chain."
}

variable "validate_certificate" {
  type        = bool
  default     = false
  description = "Set to false to prevent the validation of a acm certificate."
}



variable "enable_aws_certificate" {
  type        = bool
  default     = true
  description = "Set to false to prevent the creation of a acm certificate."
}

variable "import_certificate" {
  type        = bool
  default     = false
  description = "Set to true or false to decide the creation and import of a acm certificate."
}

variable "ttl" {
  type        = number
  default     = 600
  description = "Time to live."
}

variable "validation_option" {
  type        = any
  default     = {}
  description = "The domain name that you want ACM to use to send you validation emails. This domain name is the suffix of the email addresses that you want ACM to use."
}

variable "validation_record_fqdns" {
  type        = list(string)
  default     = []
  description = "When validation is set to DNS and the DNS validation records are set externally, provide the fqdns for the validation"
}

variable "allow_overwrite" {
  type        = bool
  default     = true
  description = "Whether to allow overwrite of Route53 records"
}

variable "private_zone" {
  type        = bool
  default     = false
  description = "Used with name field to get a private Hosted Zone."
}


