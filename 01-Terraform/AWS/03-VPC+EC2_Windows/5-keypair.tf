resource "aws_key_pair" "My-Terraform-ec2-windows-keypair" {
  key_name   = "My-Terraform-ec2-windows-keypair"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "My-Terraform-ec2-windows-keypair" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "mytfec2windowskey"
}

resource "aws_ssm_parameter" "my-Terraform-ec2-windows-ssm" {
  depends_on = [aws_instance.my-Terraform-ec2-windows]
  name       = "windows-password"
  type       = "SecureString"
  value      = rsadecrypt(aws_instance.my-Terraform-ec2-windows.password_data, nonsensitive(tls_private_key.rsa.private_key_pem))
}

#resource "tls_private_key" "instance_key" {
#  algorithm = "RSA"
#}

#resource "aws_key_pair" "instance_key_pair" {
#  key_name   = "windows-instance-key"
# public_key = tls_private_key.instance_key.public_key_openssh
#}
