# instance EC2 Public IP 
output "my-Terraform-ec2-public-ip" {
  value = aws_instance.my-Terraform-ec2.public_ip
}
