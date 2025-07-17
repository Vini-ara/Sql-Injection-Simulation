resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.default_tag
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }

  tags = {
    Name = var.default_tag
  }
}

resource "aws_subnet" "bancoApi" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = var.default_tag
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.bancoApi.id
  route_table_id = aws_route_table.route_table.id
}
