resource "aws_s3_bucket" "vulnerable" {
  bucket = "tc02-public-access-test"

  tags = {
    Name     = "tc02-public-access-test"
    TestCase = "TC02"
  }
}

resource "aws_s3_bucket_public_access_block" "vulnerable" {
  bucket = aws_s3_bucket.vulnerable.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}