resource "aws_security_group" "restricted_ssh" {
  #checkov:skip=CKV2_AWS_5:Standalone test fixture; security-group attachment is demonstrated in the baseline

  name        = "tc01-restricted-ssh"
  description = "Hardened security group for TC01"

  ingress {
    description = "SSH access restricted to one authorised address"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["203.0.113.10/32"]
  }

  tags = {
    Name     = "tc01-restricted-ssh"
    TestCase = "TC01"
  }
}