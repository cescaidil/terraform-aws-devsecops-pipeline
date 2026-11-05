resource "aws_kms_key" "tc03" {
  description         = "Customer-managed KMS key for TC03"
  enable_key_rotation = true

  tags = {
    Name     = "tc03-s3-kms-key"
    TestCase = "TC03"
  }
}

resource "aws_s3_bucket" "tc03_hardened" {
  bucket = "tc03-kms-s3-test"

  tags = {
    Name     = "tc03-kms-s3-test"
    TestCase = "TC03"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tc03_hardened" {
  bucket = aws_s3_bucket.tc03_hardened.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = aws_kms_key.tc03.arn
    }

    bucket_key_enabled = true
  }
}