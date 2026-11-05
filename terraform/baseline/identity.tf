data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole"
    ]

    principals {
      type = "Service"

      identifiers = [
        "ec2.amazonaws.com"
      ]
    }
  }
}

resource "aws_iam_role" "baseline_ec2" {
  name_prefix        = "cp-project-baseline-ec2-"
  description        = "Least-privilege IAM role for the baseline EC2 instance"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json

  tags = {
    Name = "cp-project-baseline-ec2-role"
  }
}

resource "aws_iam_instance_profile" "baseline_ec2" {
  name_prefix = "cp-project-baseline-ec2-"
  role        = aws_iam_role.baseline_ec2.name

  tags = {
    Name = "cp-project-baseline-ec2-profile"
  }
}