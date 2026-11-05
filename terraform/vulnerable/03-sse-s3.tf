resource "aws_s3_bucket" "tc03_vulnerable" {
  bucket = "tc03-sse-s3-test"

  tags = {
    Name     = "tc03-sse-s3-test"
    TestCase = "TC03"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tc03_vulnerable" {
  bucket = aws_s3_bucket.tc03_vulnerable.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}