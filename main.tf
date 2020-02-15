variable "region" { default = "eu-west-2" }

provider "http" { version = "1.1" }
provider "aws" {
  version = "2.48"
  region = var.region
}

module "ddns" {
  source = "./modules"
}
