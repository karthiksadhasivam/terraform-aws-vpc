resource "aws_route" "tf-private-route" {
  count = "${length(var.public_subnet_azs)}"
  route_table_id = "${element(aws_route_table.tf-private-route-tbl.*.id, count.index)}"
  destination_cidr_block  = "0.0.0.0/0"
  nat_gateway_id  = "${element(aws_nat_gateway.nat-gw.*.id, count.index)}"
  depends_on = ["aws_route_table.tf-private-route-tbl"]
}

resource "aws_route" "tf-public-route" {
  count = "${length(aws_route_table.tf-public-route-tbl)}"
  route_table_id = "${element(aws_route_table.tf-public-route-tbl.*.id, count.index)}"
  destination_cidr_block  = "0.0.0.0/0"
  gateway_id  = "${aws_internet_gateway.igw.id}"
  depends_on = ["aws_route_table.tf-public-route-tbl"]
}