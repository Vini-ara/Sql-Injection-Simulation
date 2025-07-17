resource "aws_security_group" "firwall_banco" {
  name        = "firewall"
  description = "Security group para banco de dados"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    security_groups = [aws_security_group.firewall_webServer.id, aws_security_group.ssh_webServer.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.default_tag
  }
}

resource "aws_security_group"  "ssh_banco" {
  name        = "firewall_bancossh"
  description = "Security group para banco de dados SSH"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.default_tag
  }
}


