
resource "aws_security_group" "learn_ec2_sg" {
  name   = var.tag_name
  vpc_id = aws_vpc.learn_ec2_vpc.id
}

resource "aws_security_group_rule" "learn_ec2_ingress" {
  type              = "ingress"
  from_port         = "22"
  to_port           = "22"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.learn_ec2_sg.id
}

resource "aws_security_group_rule" "learn_ec2_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.learn_ec2_sg.id
}
