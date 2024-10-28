# El "ingress" de este SG se puede eliminar pq podemos acceder a las instancias desde la consola de AWS.
resource "aws_security_group" "ec2-windows-SG" {
  name        = "Terraform-ec2-windows-SG"
  description = "Terraform Security Group for Windows EC2"
  vpc_id      = module.vpc.vpc_id
  ingress {
    cidr_blocks = ["${chomp(data.http.my_public_ip.response_body)}/32"]
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    description = "Allow incoming RDP connections"
  }
  ingress {
    cidr_blocks = ["${chomp(data.http.my_public_ip.response_body)}/32"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "Allow incoming SSH connections"
  }
  ingress {
    cidr_blocks = ["${chomp(data.http.my_public_ip.response_body)}/32"]
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    description = "Allow incoming HTTPS connections"
  }
  ingress {
    cidr_blocks = ["${chomp(data.http.my_public_ip.response_body)}/32"]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    description = "Allow incoming HTTP connections"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Terraform-ec2-windows-SG"
  }
}
