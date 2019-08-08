# Create public route table
resource "aws_route_table" "tf-public-route-tbl" {
  count = "${length(var.public_subnet_azs)}"
  vpc_id  = "${aws_vpc.tfvpc.id}"
  tags = {
    Name = "${var.vpc_env}-tf-public-rt-table-${element(split("-",var.public_subnet_azs[count.index]),2)}"
  }
  depends_on = ["aws_internet_gateway.igw"]
}

# Create private route table
resource "aws_route_table" "tf-private-route-tbl"  {
  count = "${length(var.private_subnet_azs)}"
  vpc_id  = "${aws_vpc.tfvpc.id}"
  tags = {
    Name = "${var.vpc_env}-tf-private-rt-table-${element(split("-",var.private_subnet_azs[count.index]),2)}"
  }
  depends_on  = ["aws_nat_gateway.nat-gw"]
}

# Create private route table association
resource "aws_route_table_association" "tf-private-route-association" {
  count = "${length(var.private_subnet)}"
  subnet_id = "${element(aws_subnet.tfprivate.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.tf-private-route-tbl.*.id, count.index)}"
}

# Create public route table association
resource "aws_route_table_association" "tf-public-route-association" {
  count = "${length(var.public_subnet)}"
  subnet_id = "${element(aws_subnet.tfpublic.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.tf-public-route-tbl.*.id, count.index)}"
}