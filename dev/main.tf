terraform {
    backend "s3" {
        bucket = "<your bucket name>"
        key = "dev-vpc/terraform.tfstate"
        region = "us-east-1"
        encrypt = true
        profile = "dev"
    }
}

provider "aws" {
  profile = "dev"
  region = "us-east-1"
}

module "terraform-dev-vpc" {

region = "us-east-1"
vpc_env = "dev"
vpc_cidr_block = "10.38.0.0/16"
private_subnet = [ "10.38.8.0/22", "10.38.12.0/22" ]
private_subnet_azs = [ "us-east-1a", "us-east-1b" ]
public_subnet =  [ "10.38.0.0/22", "10.38.4.0/22" ]
public_subnet_azs = [ "us-east-1a", "us-east-1b" ]

source = "../module"
}