resource "aws_iam_policy" "tc06_vulnerable" {
  name        = "tc06-wildcard-policy"
  description = "Intentionally vulnerable wildcard IAM policy for TC06"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Sid      = "AllowAllActions"
        Effect   = "Allow"
        Action   = "*"
        Resource = "*"
      }
    ]
  })

  tags = {
    Name     = "tc06-wildcard-policy"
    TestCase = "TC06"
  }
}