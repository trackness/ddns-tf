variable "region" { default = "eu-west-2" }

provider "http" { version = "1.1" }
provider "aws" {
  version = "2.48"
  region = var.region
}

module "ddns" {
  source = "./modules"
  hosted_zones = local.hosted_zones
}

locals {
  hosted_zones_map = var.yaml_config != "" ? yamldecode(file("./${var.yaml_config}")) : []
  hosted_zones = [for hosted_zone in local.hosted_zones_map : hosted_zone.url]
}

variable "yaml_config" {
  type = string
  default = ""
}
