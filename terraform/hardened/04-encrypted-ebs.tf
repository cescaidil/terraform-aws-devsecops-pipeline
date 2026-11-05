resource "aws_ebs_volume" "tc04_hardened" {
  availability_zone = "ap-southeast-1a"
  size              = 8
  type              = "gp3"
  encrypted         = true

  tags = {
    Name     = "tc04-encrypted-ebs"
    TestCase = "TC04"
  }
}