resource "aws_acm_certificate" "cert" {
  domain_name = var.domain_name
  validation_method = "DNS"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "cert" {
  count = 1
  certificate_arn = aws_acm_certificate.cert.arn
  validation_record_fqdns = aws_route53_record.cert_validation[count.index].fqdn
}