resource "aws_instance" "monitoring" {
  ami           = "ami-05eb56e0befdb025f"
  instance_type = "t3.medium"
  key_name      = aws_key_pair.chave_ssh.key_name
  subnet_id     = aws_subnet.bancoApi.id
  
  vpc_security_group_ids = [aws_security_group.firewall_monitoring.id, aws_security_group.ssh_monitoramento.id]
  
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

resource "aws_eip" "monitoring" {
  instance = aws_instance.monitoring.id
  
  tags = {
    Name = var.default_tag
  }
}

output "public_ip_monitoring" {
  value = aws_eip.monitoring.public_ip
}

output "private_ip_monitoring" {
  value = aws_instance.monitoring.private_ip
}

output "ssh_command_monitoring" {
  value = "ssh -i ${var.ssh_key_path} ubuntu@${aws_eip.monitoring.public_ip}"
}
