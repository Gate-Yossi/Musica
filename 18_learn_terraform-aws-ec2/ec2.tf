
# AMI
data "aws_ssm_parameter" "learn_ec2_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

# EC2作成
resource "aws_instance" "learn_ec2_instance" {
  ami                         = data.aws_ssm_parameter.learn_ec2_ami.value
  instance_type               = "t2.micro"
  availability_zone           = var.az_a
  subnet_id                   = aws_subnet.learn_ec2_public_subnet_1a.id
  associate_public_ip_address = "true"
  tags = {
    Name = "${var.tag_name}"
  }
}