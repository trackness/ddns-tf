variable "home_ip" {
  type = string
  default = ""
}
variable "route_53_urls" {
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
