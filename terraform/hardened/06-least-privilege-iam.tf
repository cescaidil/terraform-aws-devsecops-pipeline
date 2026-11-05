resource "aws_iam_policy" "tc06_hardened" {
  name        = "tc06-least-privilege-policy"
  description = "Least-privilege IAM policy for TC06"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Sid      = "ReadOneAuthorisedObject"
        Effect   = "Allow"
        Action   = "s3:GetObject"
        Resource = "arn:aws:s3:::tc06-private-bucket/example.txt"
      }
    ]
  })

  tags = {
    Name     = "tc06-least-privilege-policy"
    TestCase = "TC06"
  }
}