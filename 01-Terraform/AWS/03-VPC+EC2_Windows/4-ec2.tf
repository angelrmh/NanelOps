#Create EC2 Windows instance
resource "aws_instance" "my-Terraform-ec2-windows" {
  #count                       = 1
  ami                         = data.aws_ami.windows-2019.id
  instance_type               = "t2.micro"
  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.ec2-windows-SG.id]
  key_name                    = "My-Terraform-ec2-windows-keypair"
  get_password_data           = true
  tags = {
    Name = "My-Terraform-ec2-windows"
  }
}
