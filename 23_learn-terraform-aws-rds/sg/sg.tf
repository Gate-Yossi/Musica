
resource "aws_security_group" "default" {
  vpc_id = "${var.vpc_id}"
  tags = {
    Name = "${var.tag_name}"
  }
}

resource "aws_security_group_rule" "mysql" {
  type              = "ingress"
  from_port         = "3306"
  to_port           = "3306"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.default.id
}

resource "aws_security_group_rule" "out_all_allow" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.default.id
}
