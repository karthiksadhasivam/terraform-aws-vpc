variable "region" {}

variable "vpc_env" {}

variable "vpc_cidr_block" {}

variable "private_subnet" {
    type = "list"
}

variable "private_subnet_azs" {
    type = "list"
}

variable "public_subnet" {
    type = "list"
}

variable "public_subnet_azs" {
    type = "list"
}

