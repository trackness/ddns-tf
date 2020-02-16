variable "hosted_zones" {
  type = set(string)
  default = []
}

module "get_ip" {
  source = "./get_ip"
}

module "set_ip" {
  source        = "./set_ip"
  home_ip       = module.get_ip.home_ip
  route_53_urls = var.hosted_zones
}
