provider "http" { version = "1.1" }

provider "aws" {
  version = "2.48"
  region = var.region
}

variable "region" {
  description = "The AWS region in which the profile credentials are valid."
  default = "eu-west-2"
}

variable "yaml_config" {
  description = "Location of the yaml file containing the URLS to be redirected relative to the root module."
  type = string
  default = ""
}

locals {
  hosted_zones_map = var.yaml_config != "" ? yamldecode(file("${path.root}/${var.yaml_config}")) : []
  hosted_zones = [for hosted_zone in local.hosted_zones_map : hosted_zone.url]
}

module "get_ip" {
  source = "./get_ip"
}

module "set_ip" {
  source        = "./set_ip"
  home_ip       = module.get_ip.home_ip
  route_53_urls = local.hosted_zones
}
