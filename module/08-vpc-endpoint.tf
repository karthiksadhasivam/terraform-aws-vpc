resource "aws_vpc_endpoint" "s3-vpce" {
  count = "${length(var.private_subnet)}"
  vpc_id = "${aws_vpc.tfvpc.id}"
  service_name = "com.amazonaws.${var.region}.s3"
  route_table_ids = ["${element(aws_route_table.tf-private-route-tbl.*.id,count.index)}", "${element(aws_route_table.tf-public-route-tbl.*.id,count.index)}"]
  tags = {
    Name = "${var.vpc_env}-tf-s3-vpce-${element(split("-",var.public_subnet_azs[count.index]),2)}"
  }
}