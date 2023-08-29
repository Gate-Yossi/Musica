# VPC
resource "aws_vpc" "default" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true # DNSホスト名を有効化
  tags = {
    Name = "${var.tag_name}"
  }
}

# Subnet
resource "aws_subnet" "public_1a" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = "10.0.0.0/20"
  availability_zone = var.az_a
  tags = {
    Name = "${var.tag_name}"
  }
}

resource "aws_subnet" "public_1c" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = "10.0.16.0/20"
  availability_zone = var.az_c
  tags = {
    Name = "${var.tag_name}"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.default.id
  tags = {
    Name = "${var.tag_name}"
  }
}

# Route table
resource "aws_route_table" "default" {
  vpc_id = aws_vpc.default.id
  tags = {
    Name = "${var.tag_name}"
  }
}

resource "aws_route" "default" {
  route_table_id         = aws_route_table.default.id
  gateway_id             = aws_internet_gateway.default.id
  destination_cidr_block = "0.0.0.0/0"
}

# SubnetとRoute tableの関連付け
resource "aws_route_table_association" "public_1a" {
  subnet_id      = aws_subnet.public_1a.id
  route_table_id = aws_route_table.default.id
}

resource "aws_route_table_association" "public_1c" {
  subnet_id      = aws_subnet.public_1c.id
  route_table_id = aws_route_table.default.id
}

