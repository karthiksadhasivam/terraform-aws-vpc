resource "aws_vpn_gateway" "tf-vpn-gw" {
    vpc_id = "${aws_vpc.tfvpc.id}"
    tags = {
        Name = "${var.vpc_env}-tf-vgw"
    }
    depends_on = ["aws_vpc.tfvpc"]
}