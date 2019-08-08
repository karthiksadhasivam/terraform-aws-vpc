#Create private subnets
resource "aws_subnet" "tfprivate" {
  count = "${length(var.private_subnet)}"
  vpc_id = "${aws_vpc.tfvpc.id}"
  cidr_block = "${var.private_subnet[count.index]}"
  availability_zone = "${var.private_subnet_azs[count.index]}"
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.vpc_env}-tf-private-${element(split("-",var.private_subnet_azs[count.index]),2)}"
    Type = "Private"
  }
}

#Create public subnets
resource "aws_subnet" "tfpublic" {
  count = "${length(var.public_subnet)}"
  vpc_id = "${aws_vpc.tfvpc.id}"
  cidr_block = "${var.public_subnet[count.index]}"
  availability_zone = "${var.public_subnet_azs[count.index]}"
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.vpc_env}-tf-public-${element(split("-",var.public_subnet_azs[count.index]),2)}"
    Type = "Public"
  }
}