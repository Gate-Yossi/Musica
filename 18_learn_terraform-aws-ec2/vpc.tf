
# VPC
resource "aws_vpc" "learn_ec2_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true # DNSホスト名を有効化
  tags = {
    Name = "${var.tag_name}"
  }
}

# Subnet
resource "aws_subnet" "learn_ec2_public_subnet_1a" {
  vpc_id            = aws_vpc.learn_ec2_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = var.az_a

  tags = {
    Name = "${var.tag_name}"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "learn_ec2_igw" {
  vpc_id = aws_vpc.learn_ec2_vpc.id
  tags = {
    Name = "${var.tag_name}"
  }
}

# Route table
resource "aws_route_table" "learn_ec2_rt" {
  vpc_id = aws_vpc.learn_ec2_vpc.id

  tags = {
    Name = "${var.tag_name}"
  }
}

resource "aws_route" "learn_ec2_rt_public" {
  route_table_id         = aws_route_table.learn_ec2_rt.id
  gateway_id             = aws_internet_gateway.learn_ec2_igw.id
  destination_cidr_block = "0.0.0.0/0"
}

# SubnetとRoute tableの関連付け
resource "aws_route_table_association" "learn_ec2_rt_associate" {
  subnet_id      = aws_subnet.learn_ec2_public_subnet_1a.id
  route_table_id = aws_route_table.learn_ec2_rt.id
}
