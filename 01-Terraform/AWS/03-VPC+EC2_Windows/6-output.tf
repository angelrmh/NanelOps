# IP pública de la instancia EC2 Windows 
output "my-Terraform-ec2-public-ip" {
  value = aws_instance.my-Terraform-ec2-windows.public_ip
}

# Exportar las credenciales a un archivo de texto
resource "local_file" "RDP_key" {
  filename = "windows_key.txt"
  content  = aws_ssm_parameter.my-Terraform-ec2-windows-ssm.value
}
