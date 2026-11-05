terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
resource "aws_security_group" "tc01_demo" {
  name        = "tc01-public-ssh-demo"
  description = "Demonstration security group for TC01"

  ingress {
    description = "Restricted Administrative Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["203.0.113.10/32"]
  }

  tags = {
    Name     = "tc01-public-ssh-demo"
    TestCase = "TC01"
  }
}