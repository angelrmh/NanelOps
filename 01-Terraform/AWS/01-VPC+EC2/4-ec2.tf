resource "aws_instance" "my-Terraform-ec2" {
  count                       = 1
  ami                         = "ami-04a81a99f5ec58529"
  instance_type               = "t2.micro"
  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.ec2.id]
  key_name                    = "My-Terraform-ec2-keypair"
  tags = {
    Name = "My-Terraform-ec2"
  }
}
