variable "region" {
  description = "The AWS region in which the profile credentials are valid."
  default = "eu-west-2"
}

provider "http" { version = "1.1" }
provider "aws" {
  version = "2.48"
  region = var.region
}

module "ddns" {
  description = "A home DDNS service for Route53 domains powered by Terraform."
  source = "./modules"
  hosted_zones = local.hosted_zones
}

locals {
  hosted_zones_map = var.yaml_config != "" ? yamldecode(file("${path.root}/${var.yaml_config}")) : []
  hosted_zones = [for hosted_zone in local.hosted_zones_map : hosted_zone.url]
}

variable "yaml_config" {
  description = "Location of the yaml file containing the URLS to be redirected relative to the root module."
  type = string
  default = ""
}
