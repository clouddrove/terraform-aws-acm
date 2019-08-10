resource "aws_acm_certificate" "cert" {
  count             = "${var.create_acm_certificate ? 1 : 0}"
  domain_name       = "${var.domain_name}"
  validation_method = "${var.validation_method}"

  lifecycle {
    create_before_destroy = true
  }
}
