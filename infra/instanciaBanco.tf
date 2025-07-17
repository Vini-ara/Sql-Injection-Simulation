resource "aws_instance" "banco_api" {
  ami           = "ami-03f6bd5a7e1b5824e"
  instance_type = "t4g.micro"
  key_name      = aws_key_pair.chave_ssh.key_name
  subnet_id     = aws_subnet.bancoApi.id
  
  vpc_security_group_ids = [aws_security_group.firwall_banco.id, aws_security_group.ssh_banco.id]
  
  # Configurar o volume root com 20GB
  root_block_device {
    volume_type = "gp3"
    volume_size = 20
    encrypted   = true
  }

  tags = {
    Name = var.default_tag
  }
}

resource "aws_eip" "banco_api" {
  instance = aws_instance.banco_api.id
  
  tags = {
    Name = var.default_tag
  }
}

output "public_ip_banco" {
  value = aws_eip.banco_api.public_ip
}

output "private_ip_banco" {
  value = aws_instance.banco_api.private_ip
}

output "password_banco" {
  value = aws_instance.banco_api.password_data
}

output "ssh_command_banco" {
  value = "ssh -i ${var.ssh_key_path} ubuntu@${aws_eip.banco_api.public_ip}"
}
