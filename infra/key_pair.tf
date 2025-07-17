resource "aws_key_pair" "chave_ssh" {
  key_name   = "my_key_pair"  
  public_key = file(var.ssh_key_path)  # Caminho para sua chave pública
}
