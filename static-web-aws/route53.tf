# # Only need below if you do not have a route53 zone
# resource "aws_route53_zone" "primary" {
#   name = var.domain_name
# }

resource "aws_route53_record" "www" {
  zone_id = var.route_zone_id
  name = var.domain_name
  type = "A"
  alias {
    name = aws_s3_bucket.website_bucket.website_domain
    zone_id = aws_s3_bucket.website_bucket.hosted_zone_id
    evaluate_target_health = false
  }
}