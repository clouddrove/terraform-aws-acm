#Module      : LABEL
#Description : Terraform label module variables
variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "repository" {
  type        = string
  default     = "https://registry.terraform.io/modules/clouddrove/acm/aws"
  description = "Terraform current module repo"
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "label_order" {
  type        = list(any)
  default     = []
  description = "Label order, e.g. `name`,`application`."
}

variable "attributes" {
  type        = list(any)
  default     = []
  description = "Additional attributes (e.g. `1`)."
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)."
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

variable "validation_method" {
  type        = string
  default     = ""
  description = "Which method to use for validation, DNS or EMAIL."

}

variable "enable_dns_validation" {
  type        = bool
  default     = false
  description = "Set to prevent validation of DNS."
}

variable "enable_acm_certificate" {
  type        = bool
  default     = true
  description = "Set to false to prevent the creation of a acm certificate."
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
  default     = false
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
