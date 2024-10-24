# instance EC2 Public IP 
output "my-Terraform-ec2-public-ip" {
  value = aws_instance.my-Terraform-ec2.associate_public_ip_address
}
