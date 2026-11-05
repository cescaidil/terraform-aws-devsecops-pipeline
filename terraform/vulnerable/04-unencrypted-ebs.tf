resource "aws_ebs_volume" "tc04_vulnerable" {
  availability_zone = "ap-southeast-1a"
  size              = 8
  type              = "gp3"
  encrypted         = false

  tags = {
    Name     = "tc04-unencrypted-ebs"
    TestCase = "TC04"
  }
}