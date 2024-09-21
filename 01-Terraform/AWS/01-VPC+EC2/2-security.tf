# El "ingress" de este SG se puede eliminar pq podemos acceder a las instancias desde la consola de AWS.
resource "aws_security_group" "ec2" {
  name        = "Terraform-ec2-SG"
  description = "Terraform Security Group for EC2"
  vpc_id      = module.vpc.vpc_id
  ingress {
    cidr_blocks = ["${chomp(data.http.my_public_ip.response_body)}/32"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
  ingress {
    cidr_blocks = ["${chomp(data.http.my_public_ip.response_body)}/32"]
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
  }
  ingress {
    cidr_blocks = ["${chomp(data.http.my_public_ip.response_body)}/32"]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Terraform-ec2-SG"
  }
}
