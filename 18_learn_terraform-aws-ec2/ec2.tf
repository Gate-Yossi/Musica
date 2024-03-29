
# AMI
data "aws_ssm_parameter" "learn_ec2_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

# EC2作成
resource "aws_instance" "learn_ec2_instance" {
  ami                         = data.aws_ssm_parameter.learn_ec2_ami.value
  instance_type               = "t2.micro"
  availability_zone           = var.az_a
  vpc_security_group_ids      = [aws_security_group.learn_ec2_sg.id]
  subnet_id                   = aws_subnet.learn_ec2_public_subnet_1a.id
  associate_public_ip_address = "true"
  key_name                    = var.key_name
  user_data                   = file("./userdata.sh")
  iam_instance_profile        = aws_iam_instance_profile.learn-aws-ec2-profile.name
  tags = {
    Name = "${var.tag_name}"
  }
}