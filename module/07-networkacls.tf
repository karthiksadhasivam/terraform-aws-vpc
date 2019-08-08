resource "aws_network_acl" "tf-private-acl" {
  vpc_id = "${aws_vpc.tfvpc.id}"
  subnet_ids = "${aws_subnet.tfprivate.*.id}"
  tags = {
    Name = "${var.vpc_env}-tf-private-acl"
    }
  }

resource "aws_network_acl" "tf-public-acl" {
  vpc_id = "${aws_vpc.tfvpc.id}"
  subnet_ids = "${aws_subnet.tfpublic.*.id}"
    tags = {
    Name = "${var.vpc_env}-tf-public-acl"
    }
  }

resource "aws_network_acl_rule" "tfprivate_nacl_rule" {
  network_acl_id  = "${aws_network_acl.tf-private-acl.id}"
  rule_number     = 100
  egress          = false
  protocol        = -1
  from_port       = 0
  to_port         = 65535
  rule_action     = "allow"
  cidr_block      = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "tfpublic_nacl_rule" {
  network_acl_id  = "${aws_network_acl.tf-public-acl.id}"
  rule_number     = 100
  egress          = false
  protocol        = -1
  from_port       = 0
  to_port         = 65535
  rule_action     = "allow"
  cidr_block      = "0.0.0.0/0"
}