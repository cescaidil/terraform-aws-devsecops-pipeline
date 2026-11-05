resource "aws_s3_bucket" "hardened" {
  bucket = "tc02-private-access-test"

  tags = {
    Name     = "tc02-private-access-test"
    TestCase = "TC02"
  }
}

resource "aws_s3_bucket_public_access_block" "hardened" {
  bucket = aws_s3_bucket.hardened.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}