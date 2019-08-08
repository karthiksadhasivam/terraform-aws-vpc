# Create internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id  = "${aws_vpc.tfvpc.id}"
  tags = {
    Name = "${var.vpc_env}-tf-igw"
  }
}