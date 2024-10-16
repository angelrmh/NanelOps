resource "aws_key_pair" "My-Terraform-ec2-keypair" {
  key_name   = "My-Terraform-ec2-keypair"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "My-Terraform-ec2-keypair" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "mytfec2key"
}
