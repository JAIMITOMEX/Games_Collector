# AWS Provider Configuration
provider "aws" {
  region = var.region
}

# Security Group for EC2 Instance
resource "aws_security_group" "app_security_group" {
  name        = "AppSecurityGroup"
  description = "Allow SSH, HTTP, Jenkins, and Flask App Access"

  ingress {
    from_port   = 22  # SSH
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80  # HTTP
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080  # Jenkins
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000  # Flask App
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3306  # MySQL Database
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "AppSecurityGroup"
  }
}

# EC2 Instance Creation in Default VPC
resource "aws_instance" "app_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.app_security_group.id]

  tags = {
    Name = "GamesCollector-Server"
  }
}

# Elastic IP for Consistent IP Address
resource "aws_eip" "app_eip" {
  instance = aws_instance.app_server.id

  tags = {
    Name = "AppElasticIP"
  }
}