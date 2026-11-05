resource "aws_instance" "tc05_vulnerable" {
  ami           = "ami-032598fcc7e9d1c7a"
  instance_type = "t3.micro"

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "optional"
  }

  tags = {
    Name     = "tc05-imdsv1-enabled"
    TestCase = "TC05"
  }
}