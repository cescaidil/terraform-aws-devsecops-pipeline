resource "aws_instance" "tc05_hardened" {
  ami           = "ami-032598fcc7e9d1c7a"
  instance_type = "t3.micro"

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  tags = {
    Name     = "tc05-imdsv2-required"
    TestCase = "TC05"
  }
}