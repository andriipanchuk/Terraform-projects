# # Only need below if you do not have a route53 zone
# resource "aws_route53_zone" "primary" {
#   name = var.domain_name
# }

#Below will create you an A record that ties to your bucket that will be created with s3.tf file
resource "aws_route53_record" "www" {
  zone_id = var.route_zone_id  #pulls your route53 zone ID from tfvars file
  name = var.domain_name
  type = "A"
  alias {
    name = aws_s3_bucket.website_bucket.website_domain
    zone_id = aws_s3_bucket.website_bucket.hosted_zone_id
    evaluate_target_health = false
  }
}