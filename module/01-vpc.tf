# Create VPC
resource "aws_vpc" "tfvpc" {
  cidr_block = "${var.vpc_cidr_block}"
  enable_dns_hostnames = "true"
  tags = {
    Name = "${var.vpc_env}-tf-vpc"
  }
}