resource "aws_instance" "webServer" {
  ami           = "ami-05eb56e0befdb025f"
  instance_type = "t3.micro"
  key_name      = aws_key_pair.chave_ssh.key_name
  subnet_id     = aws_subnet.bancoApi.id
  
  vpc_security_group_ids = [aws_security_group.firewall_webServer.id, aws_security_group.ssh_webServer.id]
  
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

resource "aws_eip" "webServer" {
  instance = aws_instance.webServer.id
  
  tags = {
    Name = var.default_tag
  }
}

output "public_ip_webServer" {
  value = aws_eip.webServer.public_ip
}

output "private_ip_webServer" {
  value = aws_instance.webServer.private_ip
}

output "ssh_command_webServer" {
  value = "ssh -i ${var.ssh_key_path} ubuntu@${aws_eip.webServer.public_ip}"
}
