resource "aws_vpc" "bastion-vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_subnet" "bastion-subnet" {
  cidr_block        = cidrsubnet(aws_vpc.bastion-vpc.cidr_block, 9, 1)
  vpc_id            = aws_vpc.bastion-vpc.id
  availability_zone = var.subnet_availability_zone
}

resource "aws_internet_gateway" "bastion-gw" {
  vpc_id = aws_vpc.bastion-vpc.id
}

resource "aws_route_table" "route-table-test-env" {
  vpc_id = aws_vpc.bastion-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.bastion-gw.id
  }
}

resource "aws_route_table_association" "subnet-association" {
  subnet_id      = aws_subnet.bastion-subnet.id
  route_table_id = aws_route_table.route-table-test-env.id
}

resource "aws_eip" "bastion-eip" {
  instance = aws_instance.bastion-instance.id
  domain   = "vpc"
}

resource "aws_eip_association" "bastion-eip-assoc" {
  instance_id   = aws_instance.bastion-instance.id
  allocation_id = aws_eip.bastion-eip.allocation_id
}
