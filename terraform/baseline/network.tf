resource "aws_vpc" "project" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "cp-project-vpc"
  }
}

resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.project.id
  cidr_block              = "10.10.1.0/24"
  availability_zone       = "ap-southeast-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "cp-project-private-subnet"
  }
}

resource "aws_security_group" "baseline" {
  name        = "cp-project-baseline-sg"
  description = "Baseline security group without public inbound access"
  vpc_id      = aws_vpc.project.id

  egress {
    description = "Permit outbound HTTPS traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "cp-project-baseline-sg"
  }
}