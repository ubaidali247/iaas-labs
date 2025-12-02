provider "aws" {
  region = "eu-west-1"
}

resource "aws_security_group" "my_sg" {
  name        = "cf-ec2-lab-sg"
  description = "Allow SSH"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-0acd9fd39de089f9b" # Latest Amazon Linux 2 in eu-west-1
  instance_type = "t3.micro"             # Free Tier eligible
  security_groups = [aws_security_group.my_sg.name]
  tags = {
    Name = "TF-EC2-Lab"
  }
}

