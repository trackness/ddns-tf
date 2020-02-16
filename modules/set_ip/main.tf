variable "home_ip" {
  description = "The external IP address of the local network."
  type = string
}

variable "route_53_urls" {
  description = "The Route53 URLs to which the record sets will be applied."
  type = set(string)
  default = []
}

data aws_route53_zone "hosted_zones" {
  for_each = var.route_53_urls

  name         = each.key
  private_zone = false
}

resource "aws_route53_record" "record_sets" {
  for_each = data.aws_route53_zone.hosted_zones

  name    = each.value.name
  type    = "A"
  ttl     = 60
  zone_id = each.value.zone_id
  records = [var.home_ip]
}
