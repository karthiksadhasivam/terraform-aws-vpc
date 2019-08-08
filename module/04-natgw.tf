resource "aws_eip" "tfeip" {
  count = "${length(var.public_subnet_azs)}"
  vpc   = true
}

resource "aws_nat_gateway" "nat-gw" {
  count         = "${length(var.public_subnet_azs)}"
  subnet_id     = "${element(aws_subnet.tfpublic.*.id, count.index)}"
  allocation_id = "${element(aws_eip.tfeip.*.id, count.index)}"

  tags = {
    "Name" = "${var.vpc_env}-tf-nat-gw-${element(split("-",var.public_subnet_azs[count.index]),2)}"
  }
  depends_on = ["aws_internet_gateway.igw"]
}