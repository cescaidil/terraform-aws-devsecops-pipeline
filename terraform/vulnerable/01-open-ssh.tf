resource "aws_security_group" "open_ssh" {
  name        = "tc01-open-ssh"
  description = "Intentionally vulnerable security group for TC01"

  ingress {
    description = "SSH access open to the internet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name     = "tc01-open-ssh"
    TestCase = "TC01"
  }
}
resource "aws_security_group" "open_ssh" {
  #checkov:skip=CKV2_AWS_5:Standalone test fixture; security-group attachment is demonstrated in the baseline

  name        = "tc01-open-ssh"
  description = "Intentionally vulnerable security group for TC01"
}