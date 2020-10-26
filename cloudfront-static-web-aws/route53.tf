# # Only need below if you do not have a route53 zone
# resource "aws_route53_zone" "primary" {
#   name = var.domain_name
# }

#Below will create you an A record that ties to your bucket that will be created with s3.tf file
resource "aws_route53_record" "www" {
  zone_id = var.route_zone_id  #pulls your route53 zone ID from tfvars file
  name = var.domain_name       #pulls your domain name from tfvars file
  type = "A"
  alias {
    name = aws_cloudfront_distribution.prod_distribution.domain_name
    zone_id = aws_cloudfront_distribution.prod_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cert_validation" {
  count = length(aws_acm_certificate.cert.domain_validation_options)
  name = element(aws_acm_certificate.cert.domain_validation_options.*.resource_record_name, count.index)
  type = element(aws_acm_certificate.cert.domain_validation_options.*.resource_record_type, count.index)
  zone_id = var.route_zone_id  #pulls your route53 zone ID from tfvars file
  records = [element(aws_acm_certificate.cert.domain_validation_options.*.resource_record_value, count.index)]
  ttl = 60
  depends_on = [aws_acm_certificate.cert]
}