provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "Terraform-AWS-DevSecOps"
      Environment = "Academic-Test"
      ManagedBy   = "Terraform"
    }
  }
}