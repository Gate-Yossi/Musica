
# VPC
resource "aws_vpc" "learn_ecs_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true # DNSホスト名を有効化
  tags = {
    Name = "${var.tag_name}"
  }
}

# Subnet
resource "aws_subnet" "learn_ecs_public_subnet_1a" {
  vpc_id            = aws_vpc.learn_ecs_vpc.id
  cidr_block        = "10.0.0.0/20"
  availability_zone = var.az_a
  tags = {
    Name = "${var.tag_name}"
  }
}

resource "aws_subnet" "learn_ecs_public_subnet_1c" {
  vpc_id            = aws_vpc.learn_ecs_vpc.id
  cidr_block        = "10.0.16.0/20"
  availability_zone = var.az_c
  tags = {
    Name = "${var.tag_name}"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "learn_ecs_igw" {
  vpc_id = aws_vpc.learn_ecs_vpc.id
  tags = {
    Name = "${var.tag_name}"
  }
}

# Route table
resource "aws_route_table" "learn_ecs_rt" {
  vpc_id = aws_vpc.learn_ecs_vpc.id
  tags = {
    Name = "${var.tag_name}"
  }
}

resource "aws_route" "learn_ecs_rt_public" {
  route_table_id         = aws_route_table.learn_ecs_rt.id
  gateway_id             = aws_internet_gateway.learn_ecs_igw.id
  destination_cidr_block = "0.0.0.0/0"
}

# SubnetとRoute tableの関連付け
resource "aws_route_table_association" "learn_ecs_rt_associate_1a" {
  subnet_id      = aws_subnet.learn_ecs_public_subnet_1a.id
  route_table_id = aws_route_table.learn_ecs_rt.id
}

resource "aws_route_table_association" "learn_ecs_rt_associate_1c" {
  subnet_id      = aws_subnet.learn_ecs_public_subnet_1c.id
  route_table_id = aws_route_table.learn_ecs_rt.id
}
